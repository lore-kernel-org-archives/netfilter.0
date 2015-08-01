From: azteca <azteca@liwest.at>
Subject: Re: failure to set up a "simple" rule-set to get an ssh connection
 through to a KVM/qemu guest
Date: Sat, 01 Aug 2015 19:58:20 +0200
Message-ID: <55BD08BC.7000804@liwest.at>
References: <55BC821C.3030006@liwest.at> <20150801110542.1d044f49@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=liwest.at; s=20140502;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:Message-ID; bh=RxepK8mLCczBgz9u/Y1fmHso38X3WYmS1E9D+iq/Qe4=;
	b=dCGbSYnS9SVCfuvFJHn/hGToVHx04JGlRTkmCx65M2gr0XN8Bj7rIjvsMM7pWR4IGWi2Y5F036CzwlDYswgV4HMP68w9PPo8M4bhvyGHewYDFZZ9ai2Y/jpuUhaaxfo+vobdMQ3N20ZeLjRMQYeCXTTfAUMvRkF1qjATR1FTfHb561F/QEYpPGEkadPdtutgamZbL2lItnAA2fsqZ2ZVuGt4p7HUVRubtpC39s5uoS0d8WUt5Ici91HT/UJe7KeQZlosW4Xg0qtI9cxzY9AW9Cws0RnBnj3DPixyhTjNI2zVhXoWWJuN1L273HIWkB01PPFVwaaH2EDooktDb8LLfw==;
In-Reply-To: <20150801110542.1d044f49@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, netfilter@vger.kernel.org

hey, neal!

thanks for your response, though unfortunately not the solution yet, i
am afraid...

root@RoX0R /home/aztec # cat /proc/sys/net/ipv4/ip_forward
1

cat says it is in there...
i set:
net.ipv4.ip_forward=1
in /etc/sysctl.conf
without that,  I also previously couldn't connect to the debian servers
for the missing packets form within the guest.
now i only need to figure out the other way around...
sorry, i forgot to mention that one parameter...

it is a systemd OS now, not sysVinit anymore, unfortunately.





On 08/01/2015 05:05 PM, Neal P. Murphy wrote:
>
>
> On Sat, 01 Aug 2015 10:23:56 +0200
> azteca <azteca@liwest.at> wrote:
>
>> Good day, Ladies and Gentlemen!
>>
>> If I might politely ask you, to assist an utter noob to the subject of
>> iptables  with the following issue:
>>
>> Currently, I am in the process of setting up a KVM host with several
>> virtual machines, each of them has an own public IP.
>> That means, that four different IP-addresses are being routed to the
>> host's eth0.
>>
>> What I am trying to achieve, is to let the host have one IP, under which
>> it is reachable, and to forward each of the remaining three addresses,
>> each with an own DNS record, to one of three according KVM guests via NAT.
>>
>> What I have accomplished so far, is the following:
>> .) The KVM host is reachable per ssh through an enabled net-filter,
>> whose INPUT and FORWARD policy are otherwise set to DROP. That the
>> net-filter does work properly, is verifiable through /var/log/messages.
>> .) The KVM host is able to connect to a DNS Server properly.
>> .) The KVM host can send mails via nullmailer.
>> .) Also could I set up a KVM guest with Debian 8.1 Linux per
>> net-install, meaning, the installation inside the virtual machine was
>> able to reach the source mirrors from a minimal start-up CD-image, and
>> to download the missing installation packets from there.
>>
>> What I am failing with, is, to connect to the single first setup KVM
>> guest in which ever way.
> You may have overlooked:
>   echo 1 > /proc/sys/net/ipv4/ip_forward
>
> Without that, your system won't route packets.
>

