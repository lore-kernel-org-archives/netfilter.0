From: Elvir Kuric <omasnjak@gmail.com>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Tue, 26 May 2009 20:39:02 +0200
Message-ID: <1814bfe70905261139o3dfa9e65ue51626a61d0f4641@mail.gmail.com>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <4A1A9756.6040401@netfilter.org>
	 <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=vpsAWPbx2yWXKTmV7Vo99KP5prCbyOEt4UUxrCC0Jak=;
        b=UTWSmHytKASLhFE5aE9rQDfv6Ay0oZOWq5Zyq1Kud8acl9waqREPsFo4shmhr+0Hww
         3jyRU/5YtAvAbfeAijmXHXJ5yLQOjJEBBGy2MnkRscvKCTFXfZ74QQNrDR21HARZmgT+
         Ws2lwt7xefCqw5/APuOnYa+GiadhlYYJMgMzs=
In-Reply-To: <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eduardo Sachs <edu.sachs@gmail.com>
Cc: netfilter@vger.kernel.org

Use CARP, it is best and try to set up it on OpenBSD. On linux it is
ucarp, but I would recommend
OpenBSD + CARP

Regards,

Elvir Kuric

On Mon, May 25, 2009 at 3:35 PM, Eduardo Sachs <edu.sachs@gmail.com> wr=
ote:
> Well!!
>
> I will create a ambient of firewall active/passive.
>
> But, what better program to do this? Heartbeat? VRRP? UCARP? Keepaliv=
ed?
>
> Thanks!
>
> 2009/5/25 Pablo Neira Ayuso <pablo@netfilter.org>:
>> Eduardo Sachs wrote:
>>> Hi Friends!
>>>
>>> I'm looking for firewall solution for active/active, the clients us=
e
>>> the firewalls randomly.
>>>
>>> The conntrackd help me to replicate the state of the connection.
>>>
>>> What help to "load balance" the firewalls?
>>
>> Have a look at the "cluster match" in the git tree:
>>
>> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Diptables.git;a=3Dcom=
mit;h=3Dcd958a6c92c84095a439780b53832bb3aae2d512
>>
>> It will be available in 2.6.30. I'm still finishing some user-level
>> documentation about it. The integration with conntrackd is also on t=
he way.
>>
>> --
>> "Los honestos son inadaptados sociales" -- Les Luthiers
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
