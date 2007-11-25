From: "=?UTF-8?Q?Ph=E1=BA=A1m_Th=E1=BB=8B_Thanh_Nguy=C3=AAn?=" 
	<ptthanhnguyen@gmail.com>
Subject: Supporting nat table in ip6tables.
Date: Sun, 25 Nov 2007 21:56:44 +0700
Message-ID: <296c5f5a0711250656o750425d3vc0e1d6bcb69f1fc9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=EHUlDX65DPYSlOQuD00X4yymIinDvNZaj/4Yi0sZ+zc=;
        b=GMFTVMnWD8pmty88dwgHXgeaOQj+2SMoYyEz7zcpulvnUkKB9yJ5QUNwySaH9Ikg6k6G8uA5TEVFIXy3L0vtsKh07OguCQvxhtCahKZDIIAxMqborQFV86tVkua7DXsyN01+WdoEZ28gMB8A36Z1w3gFLHdGhYag/Gkcmr3sKVk=
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Dear Netfilter Core Team,

My name is Pham Thi Thanh Nguyen. I am a Vietnamese student.

Now I am interested in the NAT-PT system. So I want to ask you a
question related to ip6tables.

One of the main features of iptables is the supporting of network
address and port translation (IPv4 only), isn't it?

So in the ip6tables, do you have any supports to NAT-PT (network
address translation and protocol translation)? If the answer is yes,
please let me know which version (current version is ip6tables 1.3.8)
i can find out that support.

When searching by google engine with keywords "ip6tables nat", I found
something like this:
/sbin/ip6tables -t nat -P PREROUTING ACCEPT
/sbin/ip6tables -t nat -P POSTROUTING ACCEPT
/sbin/ip6tables -t nat -P OUTPUT ACCEPT

Please explain and make me know more clearly.

I appreciate highly your help.


Thank you very much.


Best Regards,
Pham Thi Thanh Nguyen
