From: Krzysztof Oledzki <ole@ans.pl>
Subject: Re: [PATCH] netfilter: remove CONFIG_NF_CT_ACCT
Date: Tue, 27 Oct 2009 14:12:12 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0910271355540.22510@bizon.gios.gov.pl>
References: <alpine.LSU.2.00.0910221615360.8582@wotan.suse.de> <alpine.LSU.2.00.0910271337120.19847@wotan.suse.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1144830174-1999984383-1256649133=:22510"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0910271337120.19847@wotan.suse.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1144830174-1999984383-1256649133=:22510
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable



On Tue, 27 Oct 2009, Jiri Kosina wrote:

> On Thu, 22 Oct 2009, Jiri Kosina wrote:
>
>> I can see several issues with CONFIG_NF_CT_ACCT and I think it should be
>> removed for the following reasons:
>>
>> 1) the netlink seems broken for the (CONFIG_NF_CT_ACCT unset &&
>>    net.netfilter.nf_conntrack_acct set) scenario. In such case,
>>    ctnetlink_nlmsg_size() seems to miscompute the size of the message, as
>>    the CTA_COUNTERS_* are not counted in at all. Seems quite serious on a
>>    first glance.

Indeed, but this code was introduced very much later:

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
itdiff_plain;h=3D2732c4e45bb67006fdc9ae6669be866762711ab5

>> 2) It has been marked as deprecated for quite some time, and was supposed
>>    to be removed in 2.6.29, but is apparently still with us.

Because it was decided that it cannot be simply removed so my initial=20
patch was rejected.

>> 3) Spits confusing warnings into dmesg.


Yep. :|

>> All this since commit 584015727a3b ("netfilter: accounting rework:
>> ct_extend + 64bit counters (v4)").
>>
>> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
>> ---
>>  Documentation/feature-removal-schedule.txt |    9 ---------
>>  Documentation/kernel-parameters.txt        |    3 +--
>>  net/netfilter/Kconfig                      |   22 ----------------------
>>  net/netfilter/nf_conntrack_acct.c          |   10 ----------
>>  net/netfilter/nf_conntrack_netlink.c       |    2 --
>>  5 files changed, 1 insertions(+), 45 deletions(-)
>
> Has this one been lost? (aka "ping").

-ETOBUSY :|

Also, please read http://lkml.org/lkml/2009/10/15/158

It would be great if you are able to provide a patch that addresses the=20
remark about connbytes.

If not, I hope I should be able to deal with this during the weekend,=20
eventually. ;)

Best regards,

 				Krzysztof Ol=EAdzki
---1144830174-1999984383-1256649133=:22510--
