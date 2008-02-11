From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Session tracking failure - ssh packets dropped as INVALID
Date: Mon, 11 Feb 2008 20:32:18 +0100
Message-ID: <47B0A2C2.5030907@rtij.nl>
References: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au> <47AEA957.2030707@caf.com.tr> <47AF5BAE.7030700@rtij.nl> <F7BF9AD4-B6CE-4DCB-A2E1-85E16AC38282@uq.edu.au> <47AFAEA4.2040202@snapgear.com> <Pine.LNX.4.64.0802111828200.16716@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0802111828200.16716@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Philip Craig <philipc@snapgear.com>, John Zornig <j.zornig@uq.edu.au>, netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> On Mon, 11 Feb 2008, Philip Craig wrote:
>
>   
>> John Zornig wrote:
>>     
>>> echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
>>>       
>> This is just a workaround for a bug.
>>
>> Are you using a recent kernel?
>>     

I'm not the OP, so FWIW. I see this on two machines where I also have 
root. Both have older kernels. One runs Xen, so upgrading is not easy. 
I'll try to upgrade the other to see if the problem goes away.

HTH,
M4

