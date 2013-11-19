From: Jim Mellander <jmellander@lbl.gov>
Subject: Re: iptables as landmine subnet rejector
Date: Tue, 19 Nov 2013 11:33:24 -0800
Message-ID: <CADju=b4pjXviR_Ck2Km8a-tmgoXwxhyQP74hSzYinOJ1A-reRA@mail.gmail.com>
References: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
	<CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
	<20131113221711.GA9944@home>
	<CADju=b5v+BhTrqXm1gm5h8Q6vB-ufV_FLRcg8cjA75zV9rfvgQ@mail.gmail.com>
	<20131119162357.GA13678@home>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20131119162357.GA13678@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Oester <kernel@linuxace.com>
Cc: netfilter@vger.kernel.org

Thanks for the response!  I would expect that host_unreachable appear
to come from the gateway, but that a port_unreachable would appear to
come from the target host.  RFC 792 says: " Codes 0, 1, 4, and 5 may
be received from a gateway. Codes 2 and 3 may be received from a
host." - and I know that "may" doesn't mean "must", but the behavior
is different than what would be expected from traffic being sent to a
live host, and the port not being reachable.

In any event, I prefer the solution of NATing to a closed UDP port, as
the port_unreachable appears to come from the IP that the UDP packet
was sent to - I want to mimic as closely as possible the behavior of
hosts that are alive, but have no open ports.

On Tue, Nov 19, 2013 at 8:23 AM, Phil Oester <kernel@linuxace.com> wrote:
> On Thu, Nov 14, 2013 at 09:12:07AM -0800, Jim Mellander wrote:
>> tcpdump output:
>> 1384448210.669303 IP bad_host.23870 > landmine_host.61871: UDP, length 20
>> 1384448210.669325 IP myip > bad_host ICMP bad_host udp port 61871
>> unreachable, length 56
>>
>> Note that the ICMP port unreachable didn't come from landmine_host, as expected.
>
> That is how the REJECT target works.  The ICMP will come from the gateway.
>
> Phil
