# HR Entity

## Overview

The HR Entity GraphQL service is designed to enable seamless querying of employee data within the WSO2 organization. This service offers advanced functionality by allowing users to filter employees based on various variables, each with its own specific filtering criteria. Notably, the HR Entity supports a highly granular level of filtering, providing users with fine-tuned control over the retrieval of employee data.

Furthermore, the API provides the flexibility to retrieve only a selected set of attributes for the queried employee(s), offering a more tailored approach to data retrieval. Additionally, users can impose limits on the number of results returned, enhancing efficiency and ensuring that only relevant information is obtained. This comprehensive feature set makes the HR Entity GraphQL service a powerful tool for efficiently managing and accessing employee data within the WSO2 organization.

## Queries

The query type defines GraphQL operations that retrieve data from the server.

### Employee

Get an employee for a given filter criteria.

Type: <a href="#Employee">Employee!!</a>

Arguments for Employee

<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#String">email</a>)</td>
<td>Employee filter criteria

```
string
```

</td>
</tr>
<tr>
<td>filter (<a href="#EmployeeFilter">EmployeeFilter</a>)</td>
<td>Employee filter criteria

```graphql
{
   "employeeId":"string",
   "email":"string",
   "excludedEmploymentTypes":"ADVISORY CONSULTANT" | "CONSULTANCY" | "INTERNSHIP" | "PART TIME CONSULTANCY" | "PERMANENT" | "PROBATION";
   "employeeStatus":"Active"|"Marked leaver"|"Left",
   "jobBand":"<jobband>",
   "lead":"true | false",
   "startDate":"YYYY-MM-DD",
   "employmentType": "ADVISORY CONSULTANT" | "CONSULTANCY" | "INTERNSHIP" | "PART TIME CONSULTANCY" | "PERMANENT" | "PROBATION"
   "location": "UAE" | "Australia" | "Brazil" | "Canada" | "US" | "Sri Lanka" | "UK" | "Argentina" | "Mexico" | "Columbia" | "Saudi Arabia" | "Germany" | "Netherland"| "Spain" | "India" | "New Zealand"
   "emailSearchString":"string",
   "businessUnit":"string"
   "department":"string"
   "team":"string"
   "managerEmail":"string"
   "isEmployeeThumbnail":"boolean"
}
```

</td>
</tr>
</tbody>
</table>

#### Sample

##### Employees Query

```graphql
query employeeQuery($workEmail: String!) {
  employee(email: $workEmail) {
    workEmail
    firstName
    lastName
    jobBand
    subordinateCount
    managerEmail
  }
}
```

##### Query Variables

```graphql
{
    "email": string
}
```

##### Response

```graphql
{
  "data": {
      "employee": {
           "workEmail": "john@wso2.com",
          "firstName": "John",
          "lastName": "Doe",
          "jobBand": 9,
          "subordinateCount": 14,
          "managerEmail": "bob@wso2.com"
      }
  }
}
```

### Employees

Get a set of employees for a given filter criteria.

Type: <a href="#Employee">[Employee!]!</a>

Arguments for Employees

<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#EmployeeFilter">EmployeeFilter</a>)</td>
<td>Employee filter criteria

```graphql
{
   "employeeId":"string",
   "email":"string",
   "excludedEmploymentTypes":"ADVISORY CONSULTANT" | "CONSULTANCY" | "INTERNSHIP" | "PART TIME CONSULTANCY" | "PERMANENT" | "PROBATION";
   "employeeStatus":"Active"|"Marked leaver"|"Left",
   "jobBand":"<jobband>",
   "lead":"true | false",
   "startDate":"YYYY-MM-DD",
   "employmentType": "ADVISORY CONSULTANT" | "CONSULTANCY" | "INTERNSHIP" | "PART TIME CONSULTANCY" | "PERMANENT" | "PROBATION"
   "location": "UAE" | "Australia" | "Brazil" | "Canada" | "US" | "Sri Lanka" | "UK" | "Argentina" | "Mexico" | "Columbia" | "Saudi Arabia" | "Germany" | "Netherland"| "Spain" | "India" | "New Zealand"
   "emailSearchString":"string",
   "businessUnit":"string"
   "department":"string"
   "team":"string"
   "managerEmail":"string"
   "isEmployeeThumbnail":"boolean"
}
```

</td>
</tr>
<tr>
<td>limit (<a href="#Int">Int</a>)</td>
<td>Limit value

`100`

</td>
</tr>
<tr>
<td>offset (<a href="#Int">Int</a>)</td>
<td>Offset value

`0`

</td>
</tr>
</tbody>
</table>

#### Sample

##### Employees Query

```graphql
query employeesQuery($filter: EmployeeFilter, $limit: Int, $offset: Int) {
  employees(filter: $filter, limit: $limit, offset: $offset) {
    workEmail
    firstName
    lastName
    department
    team
  }
}
```

##### Query Variables

```graphql
{
    "filter": {},
    "limit": 100,
    "offset": 0
}
```

##### Response

```graphql
{
  "data": {
    "employees": [
      {
        "workEmail": "bob@abc.com",
        "firstName": "Bob",
        "lastName": "Looker",
        "department": "SALES",
        "team": "ME"
      },
      {
        "workEmail": "white@abc.com",
        "firstName": "White",
        "lastName": "Saven",
        "department": "CHANNEL SALES",
        "team": "ME"
      }
    ]
  }
}
```

### Career Function

Get a specific career function for a given filter criteria.

Type: <a href="#CareerFunction">[CareerFunction!]!</a>

Arguments for Career Function

<table>x
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#Int">careerFunctionId</a>)</td>
<td>Career Function filter criteria

```graphql
{
   "careerFunctionId": Int
}
```

</td>
</tr>
</tbody>
</table>

#### Sample

##### Career Function Query

```graphql
query careerFunctionQuery($careerFunctionId: Int!) {
  careerFunction(careerFunctionId: $careerFunctionId) {
    id
    careerFunction
    designations {
      id
      designation
      jobBand
    }
  }
}
```

##### Query Variables

```graphql
{
   "careerFunctionId": Int
}
```

##### Response

```graphql

{
    "data": {
        "careerFunction": {
            "id": 1,
            "careerFunction": "Engineering",
            "designations": [
                {
                    "designation": "Intern Software Engineer",
                    "jobBand": 0,
                    "id": 1
                },
                {
                    "designation": "Trainee Software Engineer",
                    "jobBand": 3,
                    "id": 2
                },
                {
                    "designation": "Associate Software Engineer",
                    "jobBand": 4,
                    "id": 3
                },
                {
                    "designation": "Software Engineer",
                    "jobBand": 5,
                    "id": 4
                },
                {
                    "designation": "Senior Software Engineer",
                    "jobBand": 6,
                    "id": 5
                },
                {
                    "designation": "Associate Technical Lead",
                    "jobBand": 7,
                    "id": 6
                },
                {
                    "designation": "Technical Lead",
                    "jobBand": 8,
                    "id": 7
                },
                {
                    "designation": "Senior Technical Lead ",
                    "jobBand": 9,
                    "id": 8
                },
                {
                    "designation": "Associate Director / Architect ",
                    "jobBand": 10,
                    "id": 9
                },
                {
                    "designation": "Director",
                    "jobBand": 11,
                    "id": 10
                },
                {
                    "designation": "Senior Director / Distinguished Engineer",
                    "jobBand": 12,
                    "id": 11
                },
                {
                    "designation": "Vice President / Fellow",
                    "jobBand": 13,
                    "id": 12
                }
            ]
        }
    }
}
```

### Career Functions

Get a set of career functions for a given filter criteria.

Type: <a href="#CareerFunctions">[CareerFunction!]!</a>

Arguments for Career Function

<table>x
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#CareerFunctionFilter">CareerFunctionFilter</a>)</td>
<td>Career Function filter criteria

```graphql
{
   "careerFunctionIds":[int],
   "careerFunctions":[string]
}
```

</td>
</tr>
<tr>
<td>limit (<a href="#Int">Int</a>)</td>
<td>Limit value

`100`

</td>
</tr>
<tr>
<td>offset (<a href="#Int">Int</a>)</td>
<td>Offset value

`0`

</td>
</tr>
</tbody>
</table>

#### Sample

##### Career Functions Query

```graphql
query careerFunctionsQuery($filter: CareerFunctionFilter, $limit: Int) {
  careerFunctions(filter: $filter, limit: $limit) {
    id
    careerFunction
    designations {
      designation
      jobBand
      id
    }
  }
}
```

##### Query Variables

```graphql
{
    "filter": {},
    "limit": 100,
    "offset": 0
}
```

##### Response

```graphql
{
    "data": {
        "careerFunctions": [
            {
                "id": 1,
                "careerFunction": "Engineering",
                "designations": [
                    {
                        "designation": "Intern Software Engineer",
                        "jobBand": 0,
                        "id": 1
                    },
                    {
                        "designation": "Trainee Software Engineer",
                        "jobBand": 3,
                        "id": 2
                    },
                    {
                        "designation": "Associate Software Engineer",
                        "jobBand": 4,
                        "id": 3
                    },
                    {
                        "designation": "Software Engineer",
                        "jobBand": 5,
                        "id": 4
                    },
                    {
                        "designation": "Senior Software Engineer",
                        "jobBand": 6,
                        "id": 5
                    },
                    {
                        "designation": "Associate Technical Lead",
                        "jobBand": 7,
                        "id": 6
                    },
                    {
                        "designation": "Technical Lead",
                        "jobBand": 8,
                        "id": 7
                    },
                    {
                        "designation": "Senior Technical Lead ",
                        "jobBand": 9,
                        "id": 8
                    },
                    {
                        "designation": "Associate Director/Architect ",
                        "jobBand": 10,
                        "id": 9
                    },
                    {
                        "designation": "Director",
                        "jobBand": 11,
                        "id": 10
                    },
                    {
                        "designation": "Senior Director / Distinguished Engineer",
                        "jobBand": 12,
                        "id": 11
                    },
                    {
                        "designation": "Vice President / Fellow",
                        "jobBand": 13,
                        "id": 12
                    }
                ]
            },
            {
                "id": 2,
                "careerFunction": "Support",
                "designations": [
                    {
                        "designation": "Intern Software Engineer",
                        "jobBand": 0,
                        "id": 13
                    },
                    {
                        "designation": "Trainee Software Engineer",
                        "jobBand": 3,
                        "id": 14
                    },
                    {
                        "designation": "Associate Software Engineer",
                        "jobBand": 4,
                        "id": 15
                    },
                    {
                        "designation": "Software Engineer",
                        "jobBand": 5,
                        "id": 16
                    },
                    {
                        "designation": "Senior Software Engineer",
                        "jobBand": 6,
                        "id": 17
                    },
                    {
                        "designation": "Associate Technical Lead",
                        "jobBand": 7,
                        "id": 18
                    },
                    {
                        "designation": "Technical Lead",
                        "jobBand": 8,
                        "id": 19
                    },
                    {
                        "designation": "Senior Technical Lead / Senior Lead - Support Operations",
                        "jobBand": 9,
                        "id": 20
                    },
                    {
                        "designation": "Associate Director/Architect ",
                        "jobBand": 10,
                        "id": 21
                    },
                    {
                        "designation": "Director",
                        "jobBand": 11,
                        "id": 22
                    },
                    {
                        "designation": "Senior Director ",
                        "jobBand": 12,
                        "id": 23
                    },
                    {
                        "designation": "Vice President / Fellow",
                        "jobBand": 13,
                        "id": 24
                    }
                ]
            }
        ]
    }
}
```

### Organization Details

Get a set of business units, departments, teams and sub teams for a given filter criteria.

Type: <a href="#BusinessUnit">[BusinessUnit!]!</a>

Arguments for Organization Details

<table>x
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#OrgDetailsFilter">OrgDetailsFilter</a>)</td>
<td>Organization details filter criteria

```graphql
{
   "businessUnitIds":[int],
   "businessUnits":[string]
}
```

</td>
</tr>
<tr>
<td>limit (<a href="#Int">Int</a>)</td>
<td>Limit value

`100`

</td>
</tr>
<tr>
<td>offset (<a href="#Int">Int</a>)</td>
<td>Offset value

`0`

</td>
</tr>
</tbody>
</table>

#### Sample

##### Organization Details Query

```graphql
query orgDetailsQuery($filter: OrgDetailsFilter, $limit: Int) {
  orgDetails(filter: $filter, limit: $limit) {
    id
    businessUnit
    departments {
      id
      department
      teams {
        id
        team
        subTeams {
          id
          subTeam
        }
      }
    }
  }
}
```

##### Query Variables

```graphql
{
    "filter": {},
    "limit": 100,
    "offset": 0
}
```

##### Response

```graphql
{
    "data": {
        "orgDetails": [
            {
                "id": 1,
                "businessUnit": "CORPORATE",
                "departments": [
                    {
                        "id": 1,
                        "department": "ADMINISTRATION",
                        "teams": null
                    },
                    {
                        "id": 2,
                        "department": "BUSINESS OPERATIONS",
                        "teams": null
                    },
                    {
                        "id": 3,
                        "department": "CHANNEL SALES",
                        "teams": [
                            {
                                "id": 1,
                                "team": "APAC",
                                "subTeams": null
                            },
                            {
                                "id": 2,
                                "team": "EU 1",
                                "subTeams": null
                            },
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 4,
                                "team": "MEA",
                                "subTeams": null
                            },
                            {
                                "id": 5,
                                "team": "NA - SOUTH & NE",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 4,
                        "department": "CUSTOMER SUCCESS",
                        "teams": null
                    },
                    {
                        "id": 5,
                        "department": "DEVELOPER RELATIONS",
                        "teams": null
                    },
                    {
                        "id": 6,
                        "department": "DIGITAL TRANSFORMATION",
                        "teams": null
                    },
                    {
                        "id": 7,
                        "department": "ENGINEERING",
                        "teams": null
                    },
                    {
                        "id": 8,
                        "department": "FIELD SALES",
                        "teams": [
                            {
                                "id": 2,
                                "team": "EU 1",
                                "subTeams": null
                            },
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 4,
                                "team": "MEA",
                                "subTeams": null
                            },
                            {
                                "id": 6,
                                "team": "NA",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 9,
                        "department": "FINANCE",
                        "teams": null
                    },
                    {
                        "id": 10,
                        "department": "People Operations",
                        "teams": [
                            {
                                "id": 7,
                                "team": "HR",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 11,
                        "department": "LEGAL",
                        "teams": [
                            {
                                "id": 8,
                                "team": "LEGAL",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 12,
                        "department": "MARKETING",
                        "teams": null
                    },
                    {
                        "id": 13,
                        "department": "SALES",
                        "teams": [
                            {
                                "id": 1,
                                "team": "APAC",
                                "subTeams": null
                            },
                            {
                                "id": 2,
                                "team": "EU 1",
                                "subTeams": null
                            },
                            {
                                "id": 9,
                                "team": "EU 2",
                                "subTeams": null
                            },
                            {
                                "id": 10,
                                "team": "EU 3",
                                "subTeams": null
                            },
                            {
                                "id": 4,
                                "team": "MEA",
                                "subTeams": null
                            },
                            {
                                "id": 11,
                                "team": "NA - CENTRAL",
                                "subTeams": null
                            },
                            {
                                "id": 12,
                                "team": "NA - WEST",
                                "subTeams": null
                            },
                            {
                                "id": 13,
                                "team": "OEM",
                                "subTeams": null
                            },
                            {
                                "id": 14,
                                "team": "SALES DEVELOPMENT",
                                "subTeams": null
                            },
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 15,
                                "team": "NA - EAST",
                                "subTeams": null
                            },
                            {
                                "id": 6,
                                "team": "NA",
                                "subTeams": null
                            },
                            {
                                "id": 19,
                                "team": "AFRICA",
                                "subTeams": null
                            },
                            {
                                "id": 20,
                                "team": "ANZ",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 14,
                        "department": "SOLUTIONS ARCHITECTURE",
                        "teams": null
                    }
                ]
            },
            {
                "id": 2,
                "businessUnit": "IAM",
                "departments": [
                    {
                        "id": 4,
                        "department": "CUSTOMER SUCCESS",
                        "teams": null
                    },
                    {
                        "id": 7,
                        "department": "ENGINEERING",
                        "teams": null
                    },
                    {
                        "id": 8,
                        "department": "FIELD SALES",
                        "teams": [
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 6,
                                "team": "NA",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 12,
                        "department": "MARKETING",
                        "teams": null
                    },
                    {
                        "id": 13,
                        "department": "SALES",
                        "teams": [
                            {
                                "id": 1,
                                "team": "APAC",
                                "subTeams": null
                            },
                            {
                                "id": 2,
                                "team": "EU 1",
                                "subTeams": null
                            },
                            {
                                "id": 9,
                                "team": "EU 2",
                                "subTeams": null
                            },
                            {
                                "id": 10,
                                "team": "EU 3",
                                "subTeams": null
                            },
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 16,
                                "team": "NA - SOUTH",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 14,
                        "department": "SOLUTIONS ARCHITECTURE",
                        "teams": null
                    }
                ]
            },
            {
                "id": 3,
                "businessUnit": "INTEGRATION-CLOUD",
                "departments": [
                    {
                        "id": 4,
                        "department": "CUSTOMER SUCCESS",
                        "teams": null
                    },
                    {
                        "id": 7,
                        "department": "ENGINEERING",
                        "teams": null
                    },
                    {
                        "id": 12,
                        "department": "MARKETING",
                        "teams": null
                    },
                    {
                        "id": 14,
                        "department": "SOLUTIONS ARCHITECTURE",
                        "teams": null
                    }
                ]
            },
            {
                "id": 4,
                "businessUnit": "INTEGRATION-SOFTWARE",
                "departments": [
                    {
                        "id": 3,
                        "department": "CHANNEL SALES",
                        "teams": [
                            {
                                "id": 17,
                                "team": "BFSI",
                                "subTeams": null
                            },
                            {
                                "id": 18,
                                "team": "GLOBAL",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 4,
                        "department": "CUSTOMER SUCCESS",
                        "teams": null
                    },
                    {
                        "id": 7,
                        "department": "ENGINEERING",
                        "teams": null
                    },
                    {
                        "id": 8,
                        "department": "FIELD SALES",
                        "teams": [
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 12,
                        "department": "MARKETING",
                        "teams": null
                    },
                    {
                        "id": 13,
                        "department": "SALES",
                        "teams": [
                            {
                                "id": 1,
                                "team": "APAC",
                                "subTeams": null
                            },
                            {
                                "id": 2,
                                "team": "EU 1",
                                "subTeams": null
                            },
                            {
                                "id": 9,
                                "team": "EU 2",
                                "subTeams": null
                            },
                            {
                                "id": 10,
                                "team": "EU 3",
                                "subTeams": null
                            },
                            {
                                "id": 3,
                                "team": "LATAM",
                                "subTeams": null
                            },
                            {
                                "id": 11,
                                "team": "NA - CENTRAL",
                                "subTeams": null
                            },
                            {
                                "id": 15,
                                "team": "NA - EAST",
                                "subTeams": null
                            },
                            {
                                "id": 16,
                                "team": "NA - SOUTH",
                                "subTeams": null
                            },
                            {
                                "id": 12,
                                "team": "NA - WEST",
                                "subTeams": null
                            }
                        ]
                    },
                    {
                        "id": 14,
                        "department": "SOLUTIONS ARCHITECTURE",
                        "teams": null
                    }
                ]
            }
        ]
    }
}
```

### Allocations

Get set of allocations for a given list of emails.

Type: <a href="#Allocation">[Allocation!]!</a>

Arguments for Allocations

<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#AllocationsByEmailFilter">AllocationsByEmailFilter</a>)</td>
<td>Allocations by email filter

```graphql
{
  emails: ["string"],
  startDate: "string",
  endDate: "string"
}
```

</td>
</table>

#### Sample

##### Allocations Query

```graphql
query allocationQuery($filter: AllocationsByEmailFilter!) {
  allocations(filter: $filter) {
    firstName
    lastName
    team
    consultantRole
    engagementId
  }
}
```

##### Query Variables

```graphql
{
    "filter": {
        "emails": ["foo@abc.com"],
        "startDate": "2021-01-01",
        "endDate": "2023-01-01"
    }
}
```

##### Response

```graphql
{
  "data": {
    "allocations": [
      {
        "firstName": "Foo",
        "lastName": "Bar",
        "team": "Technology Specialists",
        "consultantRole": "",
        "engagementId": "123"
      }
    ]
  }
}
```

### Leaves

Get a set of employee leaves for a given filter criteria.

Type: <a href="#Leave">[Leave!]!</a>

Arguments for Leaves

<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>filter (<a href="#LeaveFilter">LeaveFilter</a>)</td>
<td>Leave filter criteria

```graphql
{
    "startDate": "YYYY-MM-DD",
    "endDate": "YYYY-MM-DD",
    "periodType": "one",
    "leaveType": "casual",
    "emails": ["user1@example.com", "user2@example.com"],
    "isActive": true,
    "orderBy": "ASC"
}

```

</td>
</tr>
<tr>
<td>limit (<a href="#Int">Int</a>)</td>
<td>Limit value

`100`

</td>
</tr>
<tr>
<td>offset (<a href="#Int">Int</a>)</td>
<td>Offset value

`0`

</td>
</tr>
</tbody>
</table>

#### Sample

##### Leaves Query

```graphql
query getLeaves($filter: LeaveFilter, $limit: Int, $offset: Int) {
  leaves(filter: $filter, limit: $limit, offset: $offset) {
    id
    startDate
    endDate
    isActive
    leaveType
    email
    periodType
    isMorningLeave
    createdDate
    emailRecipients
    effectiveDays {
      date
      isMorningLeave
      type
      periodType
    }
    calendarEventId
    numberOfDays
    location
    emailId
    emailSubject
  }
}
```

##### Query Variables

```graphql
{
    "filter": {},
    "limit": 100,
    "offset": 0
}
```

##### Response

```graphql
{
  "data": {
    "leaves": [
      {
        "id": 1234,
        "startDate": "2023-11-03T00:00:00Z",
        "endDate": "2023-11-03T00:00:00Z",
        "isActive": true,
        "leaveType": "lieu",
        "email": "user@wso2.com",
        "periodType": "half",
        "isMorningLeave": true,
        "createdDate": "2023-07-21T00:00:00Z",
        "emailRecipients": [
          "user2@wso2.com"
        ],
        "effectiveDays": [
          {
            "date": "2023-11-03T00:00:00Z",
            "isMorningLeave": true,
            "type": "lieu",
            "periodType": "half"
          }
        ],
        "calendarEventId": "123456789",
        "numberOfDays": 0.5,
        "location": "Sri Lanka",
        "emailId": "",
        "emailSubject": ""
      }
    ]
  }
}
```

## Mutations

The mutation type defines GraphQL operations that change data on the server.

### insertLeave

Creates a new leave.

Input fields for `insertLeave`

<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>input (<a href="#LeaveInput">LeaveInput!</a>)</td>
<td>Input detail for the new leave
</td>
</tr>
<tr>
<td>isValidationOnlyMode (<a href="#Boolean">Boolean</a>)</td>
<td>Flag to indicate whether to create leave or only validate
</td>
</tr>
</tbody>
</table>

#### Sample

##### Mutation insert leave

```graphql
mutation leave($input: LeaveInput!) {
  insertLeave(input: $input, isValidationOnlyMode: true) {
    id
    startDate
    endDate
    isActive
    leaveType
    email
    leavePeriodType
    isMorningLeave
    createdDate
    emailRecipients
    effectiveDays {
      date
      isMorningLeave
      type
    }
    calendarEventId
  }
}
```

##### Input Variables

```graphql
{
    "input": {
        "startDate": "2023-01-03",
        "endDate": "2023-01-06",
        "periodType": "multiple",
        "leaveType": "casual",
        "email": "foo@abc.com",
        "isMorningLeave": null,
        "emailRecipients": []
    }
}
```

##### Response

```graphql
{
    "data": {
        "insertLeave": {
            "id": 0,
            "startDate": "2023-12-03",
            "endDate": "2023-12-06",
            "isActive": false,
            "leaveType": "casual",
            "email": "user@example.com",
            "periodType": "one",
            "isMorningLeave": null,
            "createdDate": "",
            "emailRecipients": [],
            "effectiveDays": [
                {
                    "date": "2023-12-04T00:00:00Z",
                    "isMorningLeave": null,
                    "type": "casual"
                },
                {
                    "date": "2023-12-05T00:00:00Z",
                    "isMorningLeave": null,
                    "type": "casual"
                },
                {
                    "date": "2023-12-06T00:00:00Z",
                    "isMorningLeave": null,
                    "type": "casual"
                }
            ],
            "calendarEventId": null
        }
    }
}
```

## Objects

### Employee

The `Employee` object represents an individual within the organization. It encapsulates various attributes and details about an employee, providing a structured way to query and retrieve information. Fields within the `Employee` object include identifiers, personal details, employment information, team associations, and more. This object is designed to facilitate efficient and flexible data retrieval for employee-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>employeeId (<a href="#String">String</a>)</code></td>
<td>Employee ID</td>
</tr>
<tr>
<td><code>epf (<a href="#String">String</a>)</code></td>
<td>EPF number</td>
</tr>
<tr>
<td><code>title (<a href="#String">String</a>)</code></td>
<td>Employee title</td>
</tr>
<tr>
<td><code>firstName (<a href="#String">String</a>)</code></td>
<td>First name</td>
</tr>
<tr>
<td><code>lastName (<a href="#String">String</a>)</code></td>
<td>Last name</td>
</tr>
<tr>
<td><code>workEmail (<a href="#String">String</a>)</code></td>
<td>WSO2 email</td>
</tr>
<tr>
<td><code>personalEmail (<a href="#String">String</a>)</code></td>
<td>Personal email</td>
</tr>
<tr>
<td><code>gender (<a href="#String">String</a>)</code></td>
<td>Gender</td>
</tr>
<tr>
<td><code>startDate (<a href="#String">String</a>)</code></td>
<td>Start date at WSO2</td>
</tr>
<tr>
<td><code>joinedJobRole (<a href="#String">String</a>)</code></td>
<td>Joined Job Role</td>
</tr>
<tr>
<td><code>joinedLocation (<a href="#String">String</a>)</code></td>
<td>Joined Location</td>
</tr>
<tr>
<td><code>joinedBusinessUnit (<a href="#String">String</a>)</code></td>
<td>Joined Business Unit</td>
</tr>
<tr>
<td><code>joinedDepartment (<a href="#String">String</a>)</code></td>
<td>Joined Department</td>
</tr>
<tr>
<td><code>joinedTeam (<a href="#String">String</a>)</code></td>
<td>Joined Team</td>
</tr>
<tr>
<td><code>jobRole (<a href="#String">String</a>)</code></td>
<td>Job role</td>
</tr>
<tr>
<td><code>company (<a href="#String">String</a>)</code></td>
<td>Company</td>
</tr>
<tr>
<td><code>location (<a href="#String">String</a>)</code></td>
<td>Work location</td>
</tr>
<tr>
<td><code>department (<a href="#String">String</a>)</code></td>
<td>Department</td>
</tr>
<tr>
<td><code>reportsTo (<a href="#String">String</a>)</code></td>
<td>Immediate Lead's name</td>
</tr>
<tr>
<td><code>managerEmail (<a href="#String">String</a>)</code></td>
<td>Email of the manager</td>
</tr>
<tr>
<td><code>reportsToEmail (<a href="#String">String</a>)</code></td>
<td>Reporting lead chain (comma-separated list)</td>
</tr>
<tr>
<td><code>team (<a href="#String">String</a>)</code></td>
<td>Employee's team</td>
</tr>
<tr>
<td><code>subTeam (<a href="#String">String</a>)</code></td>
<td>Employee's sub team</td>
</tr>
<tr>
<td><code>supportRotationEligible (<a href="#String">String</a>)</code></td>
<td>Support rotation eligibility (true|false)</td>
</tr>
<tr>
<td><code>employmentType (<a href="#String">String</a>)</code></td>
<td>Employment type of the employee</td>
</tr>
<tr>
<td><code>resignationDate (<a href="#String">String</a>)</code></td>
<td>Resignation date</td>
</tr>
<tr>
<td><code>finalDayInOffice (<a href="#String">String</a>)</code></td>
<td>Last day at the office</td>
</tr>
<tr>
<td><code>finalDayOfEmployment (<a href="#String">String</a>)</code></td>
<td>Last day as an employee</td>
</tr>
<tr>
<td><code>employeeStatus (<a href="#String">String</a>)</code></td>
<td>Employee status (Active|left)</td>
</tr>
<tr>
<td><code>lead (<a href="#String">Boolean</a>)</code></td>
<td>Employee is a lead or not</td>
</tr>
<tr>
<td><code>supportLead (<a href="#String">String</a>)</code></td>
<td>Support lead or not</td>
</tr>
<tr>
<td><code>qspLead (<a href="#String">String</a>)</code></td>
<td>QSP lead or not</td>
</tr>
<tr>
<td><code>resignationReason (<a href="#String">String</a>)</code></td>
<td>Reason for the resignation</td>
</tr>
<tr>
<td><code>personalPhoneNumber (<a href="#String">String</a>)</code></td>
<td>Personal phone number</td>
</tr>
<tr>
<td><code>workPhoneNumber (<a href="#String">String</a>)</code></td>
<td>Work phone number</td>
</tr>
<tr>
<td><code>continuousServiceDate (<a href="#String">String</a>)</code></td>
<td>Continuous service date</td>
</tr>
<tr>
<td><code>initialDateOfJoining (<a href="#String">String</a>)</code></td>
<td>Initial date of joining</td>
</tr>
<tr>
<td><code>additionalManager (<a href="#String">String</a>)</code></td>
<td>Additional manager information</td>
</tr>
<tr>
<td><code>lengthOfService (<a href="#String">String</a>)</code></td>
<td>Length of the service</td>
</tr>
<tr>
<td><code>businessUnit (<a href="#String">String</a>)</code></td>
<td>Business unit</td>
</tr>
<tr>
<td><code>jobBand (<a href="#Int">Int</a>)</code></td>
<td>Job band</td>
</tr>
<tr>
<td><code>employeeThumbnail (<a href="#String">String</a>)</code></td>
<td>Image URL of the employee</td>
</tr>
<tr>
<td><code>relocationStatus (<a href="#String">String</a>)</code></td>
<td>Relocation status of the employee</td>
</tr>
<tr>
<td><code>lastPromotedDate (<a href="#String">String</a>)</code></td>
<td>Last promoted date</td>
</tr>
<tr>
<td><code>subordinateCount (<a href="#Int">Int</a>)</code></td>
<td>Subordinate Count of a lead employee</td>
</tr>
<tr>
<td><code>timestamp (<a href="#String">String</a>)</code></td>
<td>Timestamp</td>
</tr>
</table>

### EmployeeFilter

The Employee entity filters provide a way to query and filter employee-related information.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>employeeId (<a href="#String">String</a>)</code></td>
<td>Id of the employee</td>
</tr>
<tr>
<td><code>employeeStatus (<a href="#String">[String]</a>)</code></td>
<td>Employee status</td>
</tr>
<tr>
<td><code>excludedEmploymentTypes (<a href="#String">[String]</a>)</code></td>
<td>List of employment types that need to be excluded</td>
</tr>
<tr>
<td><code>email (<a href="#String">String</a>)</code></td>
<td>Email</td>
</tr>
<tr>
<td><code>jobBand (<a href="#Integer">[Integer]</a>)</code></td>
<td>List of job bands</td>
</tr>
<tr>
<td><code>lead (<a href="#Boolean">Boolean</a>)</code></td>
<td>Lead or not</td>
</tr>
<tr>
<td><code>startDate (<a href="#String">String</a>)</code></td>
<td>Start date of the employment</td>
</tr>
<tr>
<td><code>employmentType (<a href="#String">[String]</a>)</code></td>
<td>List of employment types</td>
</tr>
<tr>
<td><code>location (<a href="#String">String</a>)</code></td>
<td>Work location</td>
</tr>
<tr>
<td><code>emailSearchString (<a href="#String">String</a>)</code></td>
<td>Searching string value for the email</td>
</tr>
<tr>
<td><code>businessUnit (<a href="#String">String</a>)</code></td>
<td>Business Unit</td>
</tr>
<tr>
<td><code>department (<a href="#String">String</a>)</code></td>
<td>Department</td>
</tr>
<tr>
<td><code>team (<a href="#String">String</a>)</code></td>
<td>Team</td>
</tr>
<tr>
<td><code>managerEmail (<a href="#String">String</a>)</code></td>
<td>Email of the manager</td>
</tr>
<tr>
<td><code>isEmployeeThumbnail (<a href="#Boolean">Boolean</a>)</code></td>
<td>Thumbnail image of the employee is available or not</td>
</tr>
</table>

### CareerFunction

The `CareerFunction` object represents a career function within an organization. It encapsulates various attributes of a career function such as career function id, title and array of the associated `Designation`. This object is designed to facilitate efficient and flexible data retrieval for career function-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>careerFunctionId (<a href="#Int">Int</a>)</code></td>
<td>Id of the Career Function</td>
</tr>
<tr>
<td><code>careerFunctionTitle (<a href="#String">String</a>)</code></td>
<td>Title of the Career Function</td>
</tr>
<tr>
<td><code>designations (<a href="#Designation">Designation[]</a>)</code></td>
<td>Array of designations associated with</td>
</tr>
</table>

### BusinessUnit

The `BusinessUnit` object represents the business units of the organization. It encapsulates various attributes such as business unit id, , businessUnit and array of associated `Department`. This object is designed to facilitate efficient and flexible data retrieval for organization-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>id (<a href="#Int">Int</a>)</code></td>
<td>Id of the business unit</td>
</tr>
<tr>
<td><code>businessUnit (<a href="#String">String</a>)</code></td>
<td>Name of the business unit</td>
</tr>
<tr>
<td><code>departments (<a href="#Department">Department[]</a>)</code></td>
<td>Array of departments associated with</td>
</tr>
</table>

### Department

The `Department` object represents the departments of the organization. It encapsulates various attributes such as department id, department and array of associated `Team`. This object is designed to facilitate efficient and flexible data retrieval for organization-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>id (<a href="#Int">Int</a>)</code></td>
<td>Id of the department</td>
</tr>
<tr>
<td><code>department (<a href="#String">String</a>)</code></td>
<td>Name of the department</td>
</tr>
<tr>
<td><code>teams (<a href="#Team">Team[]</a>)</code></td>
<td>Array of departments associated with</td>
</tr>
</table>

### Team

The `Team` object represents the teams of the organization. It encapsulates various attributes such as team id, team and array of associated `SubTeam`. This object is designed to facilitate efficient and flexible data retrieval for organization-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>id (<a href="#Int">Int</a>)</code></td>
<td>Id of the team</td>
</tr>
<tr>
<td><code>team (<a href="#String">String</a>)</code></td>
<td>Name of the team</td>
</tr>
<tr>
<td><code>subTeams (<a href="#SubTeam">SubTeam[]</a>)</code></td>
<td>Array of sub teams associated with</td>
</tr>
</table>

### SubTeam

The `SubTeam` object represents the sub teams of the organization. It encapsulates various attributes such as sub team id and sub team. This object is designed to facilitate efficient and flexible data retrieval for organization-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>id (<a href="#Int">Int</a>)</code></td>
<td>Id of the sub team</td>
</tr>
<tr>
<td><code>subTeam (<a href="#String">String</a>)</code></td>
<td>Name of the sub team</td>
</tr>
</table>

### Designation

The `Designation` object represents a designation within an organization. It encapsulates various attributes of each designation such as designation id, job band and designation. This object is designed to facilitate efficient and flexible data retrieval for designation of specific career function-related queries.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>designationId (<a href="#Int">Int</a>)</code></td>
<td>Id of the designation</td>
</tr>
<tr>
<td><code>designation (<a href="#String">String</a>)</code></td>
<td>Title of the designation</td>
</tr>
<tr>
<td><code>jobBand (<a href="#Int">jobBand</a>)</code></td>
<td>Job band associated with the specific designation</td>
</tr>
</table>

### CareerFunctionFilter

The entity filters provide a way to query and filter career functions related information.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>careerFunctionIds (<a href="#Int">Int[]</a>)</code></td>
<td>Array of career function ids</td>
</tr>
<tr>
<td><code>careerFunctionTitles (<a href="#String">[String]</a>)</code></td>
<td>Array of career function titles</td>
</tr>
</table>

### Allocation

The `Allocation` record includes details of an employee allocation, including crucial information like dates, types, status, and the employee's involvement in specific engagements within an organization.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>id (<a href="#String">String!</a>)</code></td>
<td>Allocation record ID</td>
</tr>
<tr>
<td><code>email (<a href="#String">String!</a>)</code></td>
<td>Employee work email</td>
</tr>
<tr>
<td><code>firstName (<a href="#String">String!</a>)</code></td>
<td>Employee first name</td>
</tr>
<tr>
<td><code>lastName (<a href="#String">String!</a>)</code></td>
<td>Employee last name</td>
</tr>
<tr>
<td><code>jobRole (<a href="#String">String!</a>)</code></td>
<td>Employee job role</td>
</tr>
<tr>
<td><code>department (<a href="#String">String!</a>)</code></td>
<td>Employee department</td>
</tr>
<tr>
<td><code>team (<a href="#String">String!</a>)</code></td>
<td>Employee team</td>
</tr>
<tr>
<td><code>reportsToEmail (<a href="#String">String!</a>)</code></td>
<td>Email(s) of the lead that the employee is reporting to</td>
</tr>
<tr>
<td><code>allocationType (<a href="#Integer">Integer!</a>)</code></td>
<td>Allocation Type</td>
</tr>
<tr>
<td><code>allocationTypeName (<a href="#String">String!</a>)</code></td>
<td>Allocation Type description</td>
</tr>
<tr>
<td><code>status (<a href="#String">String!</a>)</code></td>
<td>Allocation status</td>
</tr>
<tr>
<td><code>startDate (<a href="#String">String!</a>)</code></td>
<td>Allocation start date</td>
</tr>
<tr>
<td><code>endDate (<a href="#String">String!</a>)</code></td>
<td>Allocation end date</td>
</tr>
<tr>
<td><code>isRecurring (<a href="#String">String</a>)</code></td>
<td>Allocation is recurring or not</td>
</tr>
<tr>
<td><code>startTime (<a href="#String">String</a>)</code></td>
<td>Allocation start time</td>
</tr>
<tr>
<td><code>endTime (<a href="#String">String</a>)</code></td>
<td>Allocation end time</td>
</tr>
<tr>
<td><code>timeZone (<a href="#String">String</a>)</code></td>
<td>Allocation time zone</td>
</tr>
<tr>
<td><code>addedBy (<a href="#String">String!</a>)</code></td>
<td>Allocation added by email</td>
</tr>
<tr>
<td><code>addedDate (<a href="#String">String!</a>)</code></td>
<td>Allocation added date</td>
</tr>
<tr>
<td><code>comment (<a href="#String">String</a>)</code></td>
<td>Allocation comment</td>
</tr>
<tr>
<td><code>engagementId (<a href="#String">String</a>)</code></td>
<td>Engagement ID which uniquely identifies the engagement record</td>
</tr>
<tr>
<td><code>clearanceStatus (<a href="#String">String</a>)</code></td>
<td>Allocation clearance status</td>
</tr>
<tr>
<td><code>engagementCode (<a href="#String">String!</a>)</code></td>
<td>Engagement Code of the engagement, which is the primary cost element</td>
</tr>
<tr>
<td><code>consultantRole (<a href="#String">String</a>)</code></td>
<td>Allocation role of the consultant</td>
</tr>
</table>

### AllocationsByEmailFilter

The `AllocationsByEmailFilter` provides filtering for the `Allocation` entity.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>emails (<a href="#String">[String!]!</a>)</code></td>
<td>Set of Email(s) that the allocations are to be filtered by</td>
</tr>
<tr>
<td><code>startDate (<a href="#String">String!</a>)</code></td>
<td>Beginning date of the period considered to filter allocations</td>
</tr>
<tr>
<td><code>endDate (<a href="#String">String!</a>)</code></td>
<td>Ending date of the period considered to filter allocations</td>
</tr>
<tr>
<td><code>allocTypes (<a href="#Integer">[Integer!]</a>)</code></td>
<td>Allocation types to filter, e.g., allocTypes: [75, 233]</td>
</tr>
</table>

### Leave

The `Leave` record contains employee leave data, encompassing details like dates, type, duration, and employee information.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>startDate (<a href="#String">String!</a>)</code></td>
<td>Start date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>endDate (<a href="#String">String!</a>)</code></td>
<td>End date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>leaveType (<a href="#String">String!</a>)</code></td>
<td>Leave type</td>
</tr>
<tr>
<td><code>periodType (<a href="#String">String!</a>)</code></td>
<td>Leave period type</td>
</tr>
<tr>
<td><code>email (<a href="#String">String!</a>)</code></td>
<td>Email address of the employee</td>
</tr>
<tr>
<td><code>isMorningLeave (<a href="#Boolean">Boolean</a>)</code></td>
<td>Is morning leave</td>
</tr>
<tr>
<td><code>emailRecipients (<a href="#String">[String!]</a>)</code></td>
<td>Email recipients</td>
</tr>
<tr>
<td><code>id (<a href="#Integer">Integer</a>)</code></td>
<td>Leave ID</td>
</tr>
<tr>
<td><code>isActive (<a href="#Boolean">Boolean</a>)</code></td>
<td>Is leave active</td>
</tr>
<tr>
<td><code>createdDate (<a href="#String">String</a>)</code></td>
<td>Created date</td>
</tr>
<tr>
<td><code>effectiveDays (<a href="#LeaveDay">[LeaveDay!]</a>)</code></td>
<td>Effective days</td>
</tr>
<tr>
<td><code>calendarEventId (<a href="#String">String</a>)</code></td>
<td>Calendar event ID</td>
</tr>
<tr>
<td><code>numberOfDays (<a href="#Float">Float</a>)</code></td>
<td>Number of leave days</td>
</tr>
</table>

### LeaveFilter

The `LeaveFilter` provides filters for querying the `Leave` entity.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>startDate (<a href="#String">String</a>)</code></td>
<td>Start date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>endDate (<a href="#String">String</a>)</code></td>
<td>End date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>periodType (<a href="#LeavePeriodType">LeavePeriodType</a>)<code></td>
<td>Leave period type</td>
</tr>
<tr>
<td><code>leaveType (<a href="#LeaveType">LeaveType</a>)</code></td>
<td>Leave type</td>
</tr>
<tr>
<td><code>emails (<a href="#String">[String]</a>)</code></td>
<td>Email addresses of employees</td>
</tr>
<tr>
<td><code>isActive (<a href="#Boolean">Boolean</a>)</code></td>
<td>Is leave active</td>
</tr>
<tr>
<td><code>orderBy (<a href="#OrderBy">OrderBy</a>)</code></td>
<td>Order by Ascending or Descending</td>
</tr>
</table>

### LeaveInput

The `LeaveInput` record represents the details required for leave creation.

<table>
<tr>
<th>Field</th>
<th>Description</th>
</tr>
<tr>
<td><code>startDate (<a href="#String">String!</a>)</code></td>
<td>Start date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>endDate (<a href="#String">String!</a>)</code></td>
<td>End date (yyyy-mm-dd)</td>
</tr>
<tr>
<td><code>leaveType (<a href="#String">String!</a>)</code></td>
<td>Leave type</td>
</tr>
<tr>
<td><code>periodType (<a href="#String">String!</a>)</code></td>
<td>Leave period type</td>
</tr>
<tr>
<td><code>email (<a href="#String">String!</a>)</code></td>
<td>Email address of the employee</td>
</tr>
<tr>
<td><code>isMorningLeave (<a href="#Boolean">Boolean</a>)</code></td>
<td>Is morning leave</td>
</tr>
<tr>
<td><code>emailRecipients (<a href="#String">[String!]</a>)<code>
</td>
<td>Email recipients</td>
</tr>
</table>

### LeaveDay

The `LeaveDay` record in this schema captures specific details related to an employee's leave for a given day.

<table>
  <tr>
    <th>Field</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>date (<a href="#String">String!</a>)</code></td>
    <td>Date of leave</td>
  </tr>
  <tr>
    <td><code>'type (<a href="#LeaveType">LeaveType!</a>)</code></td>
    <td>Field description</td>
  </tr>
  <tr>
    <td><code>isMorningLeave (<a href="#Boolean">Boolean</a>)</code></td>
    <td>Field description</td>
  </tr>
  <tr>
    <td><code>periodType (<a href="#LeavePeriodType">LeavePeriodType!</a>)</code></td>
    <td>Field description</td>
  </tr>
</table>

## Enums

### EmploymentType

The `EmploymentType` enum represents different types of employment statuses that can be associated with an employee. Each enum value corresponds to a specific type of employment. Here's a brief description of each enum value:

- `ADVISORY_CONSULTANT`: Indicates employment as an advisory consultant.
- `CONSULTANCY`: Represents employment in a consultancy role.
- `INTERNSHIP`: Indicates an internship position.
- `PART_TIME_CONSULTANCY`: Represents part-time employment in a consultancy role.
- `PERMANENT`: Denotes permanent employment.
- `PROBATION`: Indicates employment in a probationary status.

### EmployeeStatus

The `EmployeeStatus` enum represents the different employment statuses that can be assigned to an employee. This enum is used to indicate whether an employee is currently active or has left the organization. Here are the possible values:

- `Active`: Denotes that the employee is currently active and employed.
- `MarkedLeaver`: Denotes that the employee is currently active and employed.
- `Left`: Indicates that the employee has left the organization.

### LeavePeriodType

The `LeavePeriodType` enum defines different types of leave periods available for employees. Each enum value corresponds to a specific duration of leave. Here are the available leave period types:

- `MULTIPLE_DAYS_LEAVE`: Represents a leave period spanning multiple days.
- `ONE_DAY_LEAVE`: Indicates a single-day leave period.
- `HALF_DAY_LEAVE`: Denotes a half-day leave period.

These enum values enable categorizing leave periods based on their duration, assisting in managing and categorizing various types of employee leave within the system.

### LeaveType

The `LeaveType` enum represents different types of leaves available for employees. Each enum value corresponds to a specific category or reason for taking leave. Here are the available leave types:

- `CASUAL_LEAVE`: Used for casual leaves.
- `SICK_LEAVE`: Indicates sick leave.
- `ANNUAL_LEAVE`: Represents annual or PTO leave.
- `LIEU_LEAVE`: Denotes lieu or compensatory leave.
- `MATERNITY_LEAVE`: Used for maternity-related leave.
- `PATERNITY_LEAVE`: Indicates paternity-related leave.

These enum values categorize various types of leaves based on their purposes, aiding in managing and tracking different leave categories for employees within the system.

## Scalars

Scalars are primitive values Int, Float, String, Boolean etc.

### Boolean

Represents true or false values.

### Int

Represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

### String

Represents textual data as UTF-8 character sequences. This type is most often used by GraphQL to represent free-form human-readable text.
