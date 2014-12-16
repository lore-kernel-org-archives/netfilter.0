From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 14:31:31 +0530
Message-ID: <CAA5aLPhyZnMoMqSYkYA3YHHMs1UX-kLURLZW4UgBHotDVSmCRQ@mail.gmail.com>
References: <12631645.301499.1418414592170.JavaMail.root@rockbochs.com>
	<5194407.335095.1418692803168.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=xXdVfawwmPipKizsH3gwmVJt7/x4ywxNbBBmqa0d2Sk=;
        b=A4QoqHPoZ9fOmoT+GabK9j9hvRmBOF4x+cWVf+2rZ1Vl5QW/UZt+S1Cx24vVB/InjD
         QN74GsdTBWMC0yrOKuPF8DlnrhE6SvU4t2TOIpcumVQxz1V7c8mKxdST/T6o9BezZ9a9
         eDHHqJUq5zJMjF7omfPWrSXUN6ppfv/hNg2hphPeBTQR3TktCpJbRxubymX98GsQpbD8
         ixbRXWbMx2ORKhcP42CDi+9iIIYTAkFRyEhCrpVxmdOa6CkernB9VHSxBojL2WE7HmWb
         5ELs1UGChoQsmdgWFXmrGgDxZRdDiMl82irCH5pKeZBPilS7RxFYQTAsdwWbTIa6uDa+
         AiSQ==
In-Reply-To: <5194407.335095.1418692803168.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Nelson <tnelson@rockbochs.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I might not be correct. In my understanding an Interface can be a part
of multiple vlans but it should not be possible to have all those vlan
interfaces (on the same physical interface) in the same bridge.

Can you share some more details of why do you require such set up?
What all are the connected devices and what is vlan config of each (I
understand you cannot change this configuration)?

On Tue, Dec 16, 2014 at 6:50 AM, Tim Nelson <tnelson@rockbochs.com> wrote:
> ----- Original Message -----
>> Greetings-
>>
>> I have an interesting situation that requires bridging some VLAN
>> enabled interfaces together on a Debian 7.x x86 system. On the host,
>> there is a single physical interface passing traffic natively
>> (eth0), and two tagged VLANs also passing traffic (eth0.2 and
>> eth0.3).
>>
>> The use case is that I need to bridge eth0 with eth0.2, allowing
>> layer two traffic to pass seamlessly between interfaces, and still
>> leave eth0.3 in a usable state. The switch this system is connected
>> to is outside of my control, which is the reason for the odd network
>> setup.
>>
>> What I'm finding by simply creating a new bridge br0 with members
>> eth0 and eth0.2 is no connectivity on eth0.2, and slow/quirky
>> connectivity on eth0 (native connectivity to Debian 7.x host). In
>> doing research, I've found suggestions of adding the VLAN interfaces
>> to the bridge direct, resulting in a br0, br0.2, and br0.3, but the
>> results were the same.
>>
>> It has been suggested to use ebtables to filter the VLANs from the
>> eth0 interface on the bridge, yet allow operation to the system
>> interface eth0.2/eth0.3. I found a very specific reference on the
>> ebtables site for this scenario [1], usage suggested (modified to
>> fit my environment):
>>
>> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 3 -j DROP
>> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 2 -j DROP
>>
>> If my understanding of the ebtables usage as a brouter, and the
>> kernel's interaction between all components involved, this should
>> work. However, as noted, no change in operation is observed.
>>
>> I'm hoping someone can shed light on what needs to be done for a
>> successful bridge of eth0/eth0.2, with an intact eth0.3 (point to
>> point link between Debian 7.x host and another device). I posted
>> this to the debian-users list but given the wide audience, was not
>> successful in getting relevant content.
>>
>> All tips/tricks/suggestions welcome.
>>
>> Thank you,
>>
>> --Tim
>>
>> [1] http://ebtables.netfilter.org/misc/brnf-faq.html#quiz2
>
> **bump** Any thoughts? Thanks!
>
> --Tim
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
