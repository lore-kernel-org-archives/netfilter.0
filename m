From: "Raymond Burkholder" <ray@oneunified.net>
Subject: RE: How to trace IPSec packets?
Date: Thu, 1 Feb 2018 08:21:40 -0400
Message-ID: <907801d39b57$379889c0$a6c99d40$@oneunified.net>
References: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com> <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com> <CACuyg267+379fHkBactPOShqsrXzQWxq4TM6ZBFh=WJZvqN0vQ@mail.gmail.com> <CALNXhk0ocwWiNyA=x_KVqjLL-tVXE1G2Uj917JXLV-SoG79+cg@mail.gmail.com> <CAP9CGviN_ZsMVq2M_bFvd8gkHFgF_uw-Qqb1fkokeVDALMhc7w@mail.gmail.com> <CALNXhk1aXDLfQ=+aC3mAHkgvq_Nr3uAjxBFbgt4iXEzW4zwswA@mail.gmail.com> <CAP9CGvjOSrYCYNGTD2fScBac-vLG51BwcyfE5u=eKxsai625WQ@mail.gmail.com> <CAP9CGvhH78bAfeG_RZn_kLfFzik23ETrccrGSpQxu=H2wLcpug@mail.gmail.com> <868912EE-65C5-4873-81AF-4B4C369FBAB7@gmail.com> <e9016481-7b80-8163-d2ba-9c377aa6d7ef@wagsky.com> <CA5C9BDA-A6ED-48CE-8BEC-67A50DEEEB81@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA5C9BDA-A6ED-48CE-8BEC-67A50DEEEB81@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'Glen Huang' <heyhgl@gmail.com>, 'Jeff Kletsky' <netfilter@allycomm.com>
Cc: netfilter@vger.kernel.org

> I initially gave bind a look, but since I just need edns-client-subnet support, I
> find dnsmasq to be a more lightweight solution. I think using unbound will
> lead to the same difficult as I did with dnsmasq: I ultimately need to map
> client’s in-tunnel ip to client’s public ip when they do dns requests inside
> ipsec, and I need to stick the public ip in ECS. So doing iptables in inevitable
> IMHO.

https://dnsdist.org/index.html is a rules based load balancer with various dns functionality.  Maybe load balancers might be a different question to ask?


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

