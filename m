From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Tue, 7 Oct 2014 18:27:44 -0400
Message-ID: <201410071827.44706.neal.p.murphy@alum.wpi.edu>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com> <5434458A.2030701@ngtech.co.il> <CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Would a plain unencrypted GRE tunnel between the TS and the file server 
alleviate the problem? Or if data security is a concern, set up a proper VPN 
between them. And use iptables (and other firewalls as necessary) to limit 
traffic as desired whether it's a simple tunnel or a VPN. (You don't want the 
tunnel to be an easy bypass around the firewall.)


On Tuesday, October 07, 2014 06:15:05 PM Meike Stone wrote:
> > I am still unsure why do you need the complications?
> > A basic masquerade rule should be good enough to work with a fileserver.
> 
> Yes and No, SMB does work over NAT but NOT for more than ONE Client.
> The reason is described in the link I gave
> (msdn.microsoft.com/en-us/library/ee441661.aspx)
> There are two possibilities.
> - Clients counts VC from 1 instead 0
> - Server ignores "special meaning -> reseting) of VC=0
> 
> If Fileserver = samba, the you have the option to disable reseting on VC=0
> (reset on zero vc, default disabled) On Windows server does not exist
> such option.
> => .. or read man page for smb.conf and read "reset on zero vc"
> 
> 
> For Clients, Microsoft brings for Windows 2008/Windows 7 and greater
> a special patch, that
> counts from VC from 1.
> 
> Now, over 100 Terminal Servers (w2k3) must use a fileserver in a other
> company ....
> Update all of them is no option in short time ...
> 
> > Maybe you are having other settings wrong.
> 
> No!
> 
> > You can use a routing rule to use a specific device with specific IP
> > for a specific src.
> 
> I don't understand ...
> 
> > iptables do not really supports dynamic NAT rules by default.
> 
> that sounds, that there are hacks available?
> 
> 
> Thanks Meike
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
