From: Eduardo Sachs <edu.sachs@gmail.com>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 10:35:45 -0300
Message-ID: <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <4A1A9756.6040401@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=AqG2wqH5+ddDTZ/Vk4NG68m8cgdTCArNyyTQpd4bnIs=;
        b=QmPZBPNeLQZlEIuN+j5Hicuxx0AMHqny8T5w82qU9X3lyZqELQM0m3ujqLDKbk+Uhc
         6NhGAXNQmE/pz73Ny70k8DcvOtvsThKHvS061meueGB//tAfunbJnjZGOIbzTwbqScJQ
         jby3gbahuCYUm4Q8wKKRWB7RM/s42dPzMqi24=
In-Reply-To: <4A1A9756.6040401@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Well!!

I will create a ambient of firewall active/passive.

But, what better program to do this? Heartbeat? VRRP? UCARP? Keepalived=
?

Thanks!

2009/5/25 Pablo Neira Ayuso <pablo@netfilter.org>:
> Eduardo Sachs wrote:
>> Hi Friends!
>>
>> I'm looking for firewall solution for active/active, the clients use
>> the firewalls randomly.
>>
>> The conntrackd help me to replicate the state of the connection.
>>
>> What help to "load balance" the firewalls?
>
> Have a look at the "cluster match" in the git tree:
>
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Diptables.git;a=3Dcomm=
it;h=3Dcd958a6c92c84095a439780b53832bb3aae2d512
>
> It will be available in 2.6.30. I'm still finishing some user-level
> documentation about it. The integration with conntrackd is also on th=
e way.
>
> --
> "Los honestos son inadaptados sociales" -- Les Luthiers
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
