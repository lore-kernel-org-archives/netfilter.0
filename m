From: Marc <ccc@lebertbro.com>
Subject: Re: Confusion about filtering traffic in a bridge scenario
Date: Wed, 11 Apr 2012 18:27:11 +0200
Message-ID: <4F85B0DF.7010905@lebertbro.com>
References: <4F859C03.1080803@lebertbro.com> <CA+g+BvgspbpSvoOT7OyNjyQFf24NCZLwTnZrKbc7OGxmgATGow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+g+BvgspbpSvoOT7OyNjyQFf24NCZLwTnZrKbc7OGxmgATGow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Olivier Nicole <olivier2553@gmail.com>
Cc: netfilter@vger.kernel.org

On 11/04/2012 17:36, Olivier Nicole wrote:
> Hi,
>
> On Wed, Apr 11, 2012 at 9:58 PM, Marc <ccc@lebertbro.com> wrote:
>> Hello,
>>
>> I was/am trying to setup packet filtering on a virtualisation host and
>> couldnt get it to work and was hoping for some pointers.
>>
>> Heres the setup:
>>
>> Said host has:
>> eth0 - the physical interface, no address assigned
>> br0 - the bridge interface, has IP 10.0.0.1 and gateway and default
>> route assigned to it
>> veth0 - the virtual interface for one of the VMs, has IP 192.168.0.1
>>
>> both eth0 and veth0 are added to the bridge, the networking setup is
>> functional, however I seem to be unable to filter traffic to the VM with
>> iptables. Heres what Ive tried:
>>
>> iptables -A FORWARD -m physdev --physdev-in eth0 --physdev-out veth0  -p
>> tcp --dport 22
>>
>> However, this only results in a /var/log/messages entry:
>>
>> kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
>> POSTROUTING chains for non-bridged traffic is not supported anymore.
> As this is bridged traffic, if the in interface is eth0, the out
> interface can only be veth0, omit the -physdev-out that makes problem?
Makes sense. Tried that just now - gets rid of the error message, but
still doesnt block ssh, which leads me to believe that packets heading
for the VM arent even getting to the FORWARD chain. Which in return
leads me to believe that Im missing something fundamental that I dont see.

Regards, Marc
