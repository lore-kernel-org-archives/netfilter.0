From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: IPTables
Date: Wed, 11 Apr 2012 00:45:57 -0300
Message-ID: <20120411004557.7666325c@babalu.inexo.com.br>
References: <CAODtcdf9shdm-KWvrjGHyDwjJL_p9pE4BdeSKELSTC6ww0p03g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdf9shdm-KWvrjGHyDwjJL_p9pE4BdeSKELSTC6ww0p03g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Grant <bigal.nz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Wed, 11 Apr 2012 15:03:46 +1200
Al Grant <bigal.nz@gmail.com> wrote:

> Hiya All,
> 
> I am after a little guidance please on the following problem:
> 
> My topology is as follows:
> 
> inet----router 192.168.1.254-------wlan0 192.168.1.71 && eth0
> 192.168.70.121------ip camera 192.168.70.140:80
> 
> Note:
> 
> (1) eth0 and wlan0 are on a PC running Ubuntu.
> 
> (2) Port 5555 on the router is forwarded to 80 on 192.168.1.71
> 
> (2) in sysctl I have set sysctl net.ipv4.ip_forward=1
> 
> Now what I need to do is to be able to access the IP camera from the
> inet.
> 
> So I have tried adding IPTables:
> 
> iptables -t nat -A PREROUTING -i wlan0 -d 192.168.1.71 -p tcp --dport
> 5555 -j DNAT --to 192.168.70.140:80
> 
> Now this should allow me to access the camera by pointing a web
> browser to the real world public ip on port 5555, however I get page
> cannot be displayed.

Hi

just to be sure: 192.168.1.71 is NOT your "real world public ip", is it?

Ethy
