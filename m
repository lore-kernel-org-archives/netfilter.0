From: Christian Schneider <cschneider@radiodata.biz>
Subject: nft filter cgroup
Date: Tue, 26 May 2020 15:03:01 +0200
Message-ID: <9592b21d-c862-f249-bc3a-ab89cce8b3d9@radiodata.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I want to create filter based on cgroup. What works is:
- create cgroup(v1) for net_cls
- define a classid via net_cls.classid
- create filter, that matches this classid
- add process to this cgroup

Since net_cls controller is cgroups v1 and isn't present in cgroups v2,
I wanted to ask, if there is a possibility to use cgroups v2 somehow
with nft.
According to wiki/manpage, nft only supports specifying cgroup as int
id. Is there some way to get an id of an v2 cgroup? Everything I could
find always uses the name (path) of the cgroup.
Are there plans to add filter with cgroups path?

BR, Christian
