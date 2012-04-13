From: Marc <ccc@lebertbro.com>
Subject: Re: Confusion about filtering traffic in a bridge scenario
Date: Fri, 13 Apr 2012 14:55:21 +0200
Message-ID: <4F882239.7030404@lebertbro.com>
References: <4F859C03.1080803@lebertbro.com> <CAHaYD9jLFw0Xfc3ytM9FLVPe4c_SzKAnaHdy8de1_AD85Sxx7g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHaYD9jLFw0Xfc3ytM9FLVPe4c_SzKAnaHdy8de1_AD85Sxx7g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hannah commodore <teargas@gmail.com>
Cc: netfilter@vger.kernel.org

On 13/04/2012 08:06, hannah commodore wrote:
> On Thu, Apr 12, 2012 at 00:58, Marc <ccc@lebertbro.com> wrote:
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
>> iptables
> do you use /etc/network/interfaces to create the bridge interface?
>
> I've noticed in Debian that sysctl.conf is applied before the
> if-up.d/bridge script has a chance to load the bridge module. as a
> result, the sysctl for net.bridge remain the default.
> i needed to add a post-up to my config to overcome this
>
> what is the current setting of net.bridge.bridge-nf-call-iptables?
>
> does re-applying sysctl.conf allow iptables to then pick up bridged
> traffic (sysctl -p)?
Thank you very much! This was indeed the problem! I have manually
enabled net.bridge.bridge-nf-call-(ip(6)/arp)tables and that fixed the
problem. I have now also added post-up entries to the bridge to do this
on reboots.

esac

Regards, Marc
