From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: 2 nics and traffic delayed/lost on LAN
Date: Sun, 28 Oct 2012 17:31:57 +0200
Message-ID: <508D4FED.4040105@ngtech.co.il>
References: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kim Emax <kimemax@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On 10/26/2012 5:19 PM, Kim Emax wrote:
> Hello
>
> I have two nics and a DHCP server on my server (192.168.0.1), which
> iptables controlled fine for years, but when i got a new job and
> switched to a new server + started working through VPN i saw some
> problems.
> I'm having issues with the VPN, i can sit for like 10 minutes an try
> to make a proper connection with Ciscos anyConnect against the company
> network, getting all kinds of responses, often not even a connect
> prompt. The local firewall has been disabled on this PC
> 192.168.0.132). If i plug this PC straight to the WAN instead of the
> server, VPN works fine and fast.
>
> It seems that the traffic on my internal network somehow is being
> delayed, for instance SSH, i can wait for 30 seconds before the
> keystrokes are shown on the screen. I don't recall that was an issue
> before the VPN issue appeared.
>
> Also there seems to be some packageloss, sending 10 packages from the
> company PC at home to the server/gateway results in packageloss from
> 10 to 40%
>
> Anyone got an idea for this? I've been trying to figure out the
> problem for some time now and thought i had solved it some months ago,
> but apparently not.
> WAN is connected to eth0 and LAN to eth1
> LAN is 192.168.0.0/24
Hello Kim,

it seems to me like there nothing wrong with the FW software but 
something else lower in the chain.

What Distro are you using?

Regards,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
