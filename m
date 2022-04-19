From: "Atkins, Brian" <Brian.Atkins@netapp.com>
Subject: nft JSON rule output order
Date: Tue, 19 Apr 2022 22:14:05 +0000
Message-ID: <DM8PR06MB7717442CEA8AD5A96EE9BFBCF9F29@DM8PR06MB7717.namprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DHt5Cd4AlPzRqO2yjcjBWRllbr1gdsgS2/4VKiDdbQ=;
 b=2aK+VDhztf5mnG/sVkR7MQX5nbjp19qHodbsQSOswB4Be5Z/CXm8LOrDyWjiW3doDF3mvFASCp0v/4poqQyheblvnS7T8LHMv1hd+L4701Dzlwg+UkLtQyW81MJmrs6dZjnhij0XZvif2yXathcwTbKLC5/SYkhbj1qlsuPtFWdXRR+ZZn/c7exTIhvQkQZi7bqinnDDter88tVg+x6zSFxzrGvrHzD4lb9cdBrbiChHx2Y0tWoUAeuOw9SEwKxYrKvvbqJqUloAB3iEfTOoqblx21GMM7Rmwx3zonCcWqHWC7l6Z+qrR5nx3CMXrMQfJbQP93e6Z5EB9c2Jz+ZxGg==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Will the rules for a given chain always appear in the correct order when us=
ing JSON?
I didn't see it explicitly stated, and the data structures used in JSON don=
't suggest a required ordering (as might be assumed if rules where an array=
 within a chain).

Thanks,
Brian
