---
layout: post  
title: 파이썬 기초 - Pandas and DataFrame  
date: 2017-06-15  
category:
- Python_for_Beginners  

tags: [python]  
published: true  
---

이번 포스트에서는 파이썬을 이용하여 데이터분석의 핵심이라 할 수 있는 pandas 패키지에 대해 알아보겠습니다. pandas 패키지는 숫자와 문자를 함께 표현한 테이블인 dataframe 을 사용할 수 있게 하여 R 혹은 SAS 와 유사하다는 인상을 받았습니다.

다음 자료를 참고하였습니다:
- [Flearning - Python으로 Big Data 분석하기](https://www.flearning.net/courses/6)

# Import Data 외부 데이터 읽어오기

**주의**  
- 경로명에 `\` 가 아니라 `/` 인 것에 주의합니다.
- `info.txt`, `population.csv`, `apart.xls` 는 작성자가 보유한 예제 파일입니다. 추후 인터넷에서 다운받을 수 있는 새로운 예제 파일을 이용하여 다시 작성하겠습니다. 사용되는 명령문만 참고하시기 바랍니다.

```python
import pandas as pd
import numpy as np

# TXT data, 구분자: comma
info = pd.read_csv("d:/info.txt",sep=",",encoding="euc-kr") # default는 UTF-8
info

# CSV : Comma Separated Value
population = pd.read_csv("d:/population.csv",sep=",",encoding="euc-kr") # default는 UTF-8
population

# 엑셀
apart = pd.read_excel("d:/apart.xls",sheetname=0)
apart

# 데이터 일부 보기 : 데이터명.head(), 데이터명.tail()
# 모든 데이터를 불러오면 너무 많으니 일부만 불러와서 확인합니다.
apart.head(10)
```

# 데이터 살펴보기

```python

apart.index   # RangeIndex(start=0, stop=763, step=1)
apart.shape   # (763, 14)
apart.columns # Index(['ID', '시군구', '읍면동', '본번', '부번', '단지명', '전월세구분', '전용면적', '계약일', '보증금(만원)', '월세(만원)', '층', '건축년도', '도로명'], dtype='object')

# 특정한 변수의 데이터 가져오기
apart["전용면적"]
apart.전용면적
apart.전용면적.head(10)
apart[["전용면적","전월세구분"]].head()

# 중복된 자료를 제외한 목록: numpy의 unique() 함수 사용
np.unique(apart["전월세구분"])

# 전월세구분에 대한 빈도(frequency): 데이터명["변수명"].value_counts()
apart["전월세구분"].value_counts()
apart["전월세구분"].value_counts().sort_values() # 빈도의 결과를 오름차순으로 정렬
apart["전월세구분"].value_counts().sort_values(ascending=False) # 빈도의 결과를 내림차순으로 정렬
```



# Descriptive Statistics with Pandas 기술통계량

```python
# 데이터 중에서 양적 자료에 대한 기술통계량: 데이터명.describe()
apart.describe()

# 특정 자료에 대한 기술통계량: 데이터명["변수명"].describe()
apart["전용면적"].describe()
apart["전용면적"].mean()
apart["전용면적"].std()
```


# Graphs 그래프 그리기

**참고: python 과 그래프**  
- seaborn 을 쓰면 더 깔끔한 그래프를 그릴 수 있습니다. seaborn python을 구글에서 검색해서 갤러리를 살펴봅시다.
- matplotlib.org 역시 갤러리가 있습니다. 참고합시다.
- plotly 또한 참고할만 자료가 많습니다.


```python
import matplotlib.pyplot as plt

# 막대그래프
rental_freq = apart["전월세구분"].value_counts()
rental_freq.plot(kind="bar")
plt.show()

#가로막대그래프
rental_freq.plot(kind="barh")
plt.show()


# 일변량(Univariate) 양적 자료에 대한 그래프

# 히스토그램(Histogram): 데이터명["변수명"].hist()
apart["전용면적"].hist()
plt.show()

apart["전용면적"].hist(bins=[0,50,100,150,200,250]) # 구간 지정
plt.show

apart["전용면적"].hist(bins=50) #구간의 갯수를 50개로
plt.show()


# 상자그림(Boxplot): 양적 자료에 이상치(Outlier)가 있는지 알려주는 그래프
apart.boxplot(column="전용면적")
plt.show()

apart.boxplot(column="전용면적", by="전월세구분") # 집단별 상자그림(Boxplot) - 집단은 기본적으로 질적 자료
plt.show()
```

만약 jupyter notebook 을 이용하여 코딩한다면, `%matplotlib inline` 를 끼워넣으면 매번 `plot.show()` 를 하지 않아도 됩니다.


# DataFrame Merge 데이터프레임 합치기

```python
d1=pd.DataFrame({"id":[1,2,3],"bt":["A","B","B"]})
d2=pd.DataFrame({"id":[4,5],"bt":["O","O"]})
d3=pd.DataFrame({"id":[1,2,4,5],"age":[10,20,40,50]})


# 데이터 위/아래로 합치기:concat - 데이터의 모습이 같아야 함
pd.concat([d1,d2])

# 데이터 오른쪽/왼쪽으로 합치기: merge - 동일한 key 값이 있어야 함
pd.merge(d1,d3,on="id")              # inner join (default)
pd.merge(d1,d3,on="id", how="outer") # outer join
pd.merge(d1,d3,on="id", how="left")  # left join
pd.merge(d1,d3,on="id", how="right") # right join
```

# DataFrame Indexing and Subsetting 데이터프레임 인덱싱 이해하기


```python
import numpy as np
import pandas as pd

data = {"names":["Kilho", "Kilho", "Charles", "Charles"],
        "year":[2014, 2015, 2015, 2016],
        "points":[1.5, 1.7, 2.4, 2.9]}

df = pd.DataFrame(data,
                  columns=["year", "names", "points", "panalty"],
                  index=["one", "two", "three", "four"])

# year 행만 따로 부르기
df["year"]
df.year

# year, points 두 개의 행만 따로 부르기
df[["year", "points"]]

# palaty 라는 행을 추가로 만들고 값을 입력
df["palaty"] = 0.5
df["palaty"] = [0.1, 0.2, 0.3, 0.4]

# 0 ~ 4 까지 숫자 입력
df["panalty"] = np.arange(4)

# column 끼리 계산
df["net_points"] = df["points"] - df["panalty"]

# 행 삭제하기
del df["palaty"]
del df["net_points"]
df.columns # Index(['year', 'names', 'points', 'panalty'], dtype='object')


# Subsetting
df[0:3]
df["two":"four"]
df.loc["two":"four", "points"] # .loc 는 인덱스 명칭에 기반한 subset function

df.loc[: , ["year", "points"]]

df.loc["six", :] = [2013, "HOng", 4.0, 0.2]

df.iloc[0:2, 1:3] # .iloc 는 인덱스 번호에 기반한 subsetting function

# Subsetting by Conditions
df.loc[df["year"] > 2014]
df.loc[df["names"] == "Kilho", ["names", "points"]]
df.loc[(df["points"] > 2) & (df["points"] < 4), :]
```


# DataFrame Control 데이터프레임 조작하기

```python
import numpy as np
import pandas as pd

df = pd.DataFrame(np.random.randn(6, 4))

# columns / rows 에 인덱스 붙이기
df.columns = ["A", "B", "C", "D"]
df.index = pd.date_range("20170401", periods=6) # 0 ~ 5 로 붙어있던 인덱스 대신 2017-04-01 ~ 2017-04-06 으로 변경

# E column 을 새로 만들어서 아래와 같은 값을 할당
df["E"] = [1.0, np.nan, 3.5, 6.1, np.nan, 7.0]

# NaN 값 처리: 삭제
df.dropna(how="any") # 해당 row 에서 하나라도 NaN 이 있으면 row 삭제
df.dropna(how="all") # 해당 row 에서 모두 NaN 인 경우 row 삭제

# NaN 값 처리: 특정 값 입력
df.fillna(value=0.5)

# 비어있는(null) 값 찾기
df.isnull()
df.loc[df.isnull()["E"], :] # E column에서 비어있는 값을 찾아서 모든 rows 표시

# 특정 rows 삭제
df.drop(pd.to_datetime("20170402"))
df.drop([pd.to_datetime("20170402"), pd.to_datetime("20170403")])

# 특정 columns 삭제
df.drop("E", axis=1) # axis=1 는 column 선택 옵션
df.drop(["A","E"], axis=1)
```


# DataFrame Fuctions 데이터프레임 분석용 함수 사용

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot  as plt

data = [[1.4,    np.nan],
        [7.1,      -4.5],
        [np.nan, np.nan],
        [0.75,     -1.3]]
df = pd.DataFrame(data, columns=["one", "two"], index=["a", "b", "c", "d"])


# 합계 구하기
df.sum(axis=0)    # column 합계
df.sum(axis=1)    # row 합계
df["one"].sum()   # one 라는 column 합계
df.loc["b"].sum() # b 라는 row 합계


# .mean 함수를 이용한 평균값 구하기
df.mean(axis=1, skipna=False)


# .mean, .min 함수를 이용하여 NaN 채우기
one_mean = df.mean(axis=0)["one"]
two_min  = df.min(axis=0)["two"]

df["one"] = df["one"].fillna(value=one_mean)
df["two"] = df["two"].fillna(value=two_min)


# 그래프: Box plot and Histogram
df["one"].plot.box()
plt.show()

df["one"].plot.hist()
plt.show()

df2 = pd.DataFrame(np.random.randn(6, 4),
                   columns=["A", "B", "C", "D"],
                   index=pd.date_range("20160701", periods=6))

df2["A"].corr(df2["B"])
df2["A"].cov(df2["B"])
df2.corr()
df2.cov()


# 데이터 정렬하기
dates = df2.index
random_dates = np.random.permutation(dates)
df2 = df2.reindex(index=random_dates, columns=["D", "B", "C", "A"])

df2.sort_index(axis=0) # row 이름으로 정렬 (오름차순)
df2.sort_index(axis=1) # column 이름으로 정렬 (오름차순)
df2.sort_index(axis=0, ascending=False) # row 이름으로 정렬 (내림차순)
df2.sort_index(axis=1, ascending=False) # column 이름으로 정렬 (내림차순)

df2.sort_values(by="D") # D column 값으로 정렬
df2.sort_values(by="B") # B column 값으로 정렬


# 두 가지 이상의 column 으로 정렬
df2["E"] = [1, 2, 2, 3, 3, 3]
df2["F"]= ["kim", "lee", "lee", "kim", "lee", "hong"]
df2.sort_values(["E", "F"])
```


# 데이터 분석 예제 - lendig club loan data

[Lending Club 홈페이지](https://www.lendingclub.com/info/download-data.action)에서 받을 수 있는 데이터로 작성된 예제입니다.

```python
import numpy as np
import pandas as pd

loan = pd.read_csv("loan.csv", sep=",")

loan.shape # (887379, 74)
loan.columns # Index(['id', 'member_id', 'loan_amnt', 'funded_amnt', 'funded_amnt_inv', 'term', 'int_rate', 'installment', 'grade', 'sub_grade', 'emp_title', 'emp_length', 'home_ownership', 'annual_inc', 'verification_status', 'issue_d', 'loan_status', 'pymnt_plan', 'url', 'desc', 'purpose', 'title', 'zip_code', 'addr_state', 'dti', 'delinq_2yrs', 'earliest_cr_line', 'inq_last_6mths', 'mths_since_last_delinq', 'mths_since_last_record', 'open_acc', 'pub_rec', 'revol_bal', 'revol_util', 'total_acc', 'initial_list_status', 'out_prncp', 'out_prncp_inv', 'total_pymnt', 'total_pymnt_inv', 'total_rec_prncp', 'total_rec_int', 'total_rec_late_fee', 'recoveries', 'collection_recovery_fee', 'last_pymnt_d', 'last_pymnt_amnt', 'next_pymnt_d', 'last_credit_pull_d', 'collections_12_mths_ex_med', 'mths_since_last_major_derog', 'policy_code', 'application_type', 'annual_inc_joint', 'dti_joint', 'verification_status_joint', 'acc_now_delinq', 'tot_coll_amt', 'tot_cur_bal', 'open_acc_6m', 'open_il_6m', 'open_il_12m', 'open_il_24m', 'mths_since_rcnt_il', 'total_bal_il', 'il_util', 'open_rv_12m', 'open_rv_24m', 'max_bal_bc', 'all_util', 'total_rev_hi_lim', 'inq_fi', 'total_cu_tl', 'inq_last_12m'], dtype='object')

# 특정 column 만 추출한 후 NaN 포함된 관측치 제거
loan2 = loan[["loan_amnt", "loan_status", "grade", "int_rate", "term"]]
loan2 = loan2.dropna(how="any")

loan2.head()
loan2.tail()

# categorical data 확인
loan2["loan_status"].unique() # array(['Fully Paid', 'Charged Off', 'Current', 'Default', 'Late (31-120 days)', 'In Grace Period', 'Late (16-30 days)', 'Does not meet the credit policy. Status:Fully Paid', 'Does not meet the credit policy. Status:Charged Off', 'Issued'], dtype=object)
loan2["grade"].unique() # array(['B', 'C', 'A', 'E', 'F', 'D', 'G'], dtype=object)
loan2["term"].unique() # array([' 36 months', ' 60 months'], dtype=object)

loan2.shape # (887379, 5)


# 기간별(term) 대출금액 합계
term_to_loan_amount_dic = {}
unique_term = loan2["term"].unique()

for term in unique_term:
    loan_amount_sum = loan2.loc[loan2["term"]==term, "loan_amnt"].sum()
    term_to_loan_amount_dic[term] = loan_amount_sum

# loan status 별 대출금액 합계
total_status_category = loan2["loan_status"].unique()
bad_status_category = total_status_category[[1, 3, 4, 5, 6, 8]]

loan2["bad_loan_status"] = loan2["loan_status"].isin(bad_status_category)
bad_loan_status_to_grades = loan2.loc[loan2["bad_loan_status"] == True, "grade"].value_counts()
bad_loan_status_to_grades.sort_index()

loan2["loan_amnt"].corr(loan2["int_rate"])
bad_loan_status_to_grades.to_csv("bad_loan_status.csv", sep=",")
```
