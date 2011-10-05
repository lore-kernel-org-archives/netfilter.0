From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 00:50:14 -0400
Message-ID: <CAHEKYV7qKQXM_qyAEH6sSoc3rXU9q22REWbm46DOWziN2gy_Lw@mail.gmail.com>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
	<CAHEKYV4NAdedVx0JM6O5Q4SNaDxk+2mVw_YvNJiQrt7OwQbsKA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=QUn3/IRtr6XsN7T8j3sSmCP996J9qUQcR1NyrwpcRHY=;
        b=up6kDSRVkoFn3ouT7FM4LQw5+JhZKPJSAS1HmbDQKZ15qwLlH80EBVqUCeZo8k0M3K
         vSf5soop+V3M9OW1B77nXjgXHZ8/DVZWabRDN6NiShZdW/6RrJH+9Q161gOzXcTH6n35
         1GRmud9efO/lGARDbW42wFqz2xrhpbb+uU1u4=
In-Reply-To: <CAHEKYV4NAdedVx0JM6O5Q4SNaDxk+2mVw_YvNJiQrt7OwQbsKA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Er, make SERVICES =3D=3D INPUT

On Wed, Oct 5, 2011 at 12:49 AM, Mauricio Tavares <raubvogel@gmail.com>=
 wrote:
> On Wed, Oct 5, 2011 at 12:24 AM, Netravali Ganesh
> <gnetravali@sonusnet.com> wrote:
>> Hi..
>>
>> I have multiple Ethernet =A0interface on the system. I need to enabl=
e the ssh on eth0 and block the ssh on all the other interfaces. Below =
is the iptables rules I am using. This is not working form pls lls let =
me know what is wrong. I am using RHEL6.1 system.
>>
>> =A0[root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dpo=
rt 22 -j DROP
>> =A0[root@localhost ~]# iptables -L -v -n
>> Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
>> =A0pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=
=A0 source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination
>> =A0=A0=A0 0=A0=A0=A0=A0 0 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 eth1=A0=
=A0 *=A0=A0=A0=A0=A0=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.0.=
0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:22
>>
> =A0 =A0 =A0I do not know what are your other rules, but I tend to hav=
e my
> iptables blocking everything by default and only opening the ports I
> need. Something like
>
> iptables -P INPUT =A0DROP -m comment --comment "drop everything"
> [...]
> iptables -A SERVICES =A0-i eth0 -p tcp -m tcp --dport 22 -m comment
> --comment "allow ssh into machine, from eth0" -j ACCEPT
>
