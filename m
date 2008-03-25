From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 15:13:25 -0500
Message-ID: <47E95CE5.2020402@riverviewtech.net>
References: <47E913B6.4080004@tssg.org> <47E92B5A.5030903@riverviewtech.net> <47E93099.9010602@tssg.org> <m3abkmy3ug.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m3abkmy3ug.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/25/08 14:56, Benny Amorsen wrote:
> Anyway, with the Level-7 match or Deep Packet Inspection or whichever 
> buzz words you prefer, packet filters are closer in capabilities than 
> ever before. At the same time application level proxies are faster 
> than ever before. It's hard to pick a winner.

Very good point.

I suppose one thing to think about is who is going to maintain what. 
Developers would probably be able to maintain (add / change / delete 
rules) an ALG better where as network administration staff would 
probably be able to maintain a hardware firewall better.  Of course, why 
not use some of each.  Use the hardware firewall for the lower end 
simpler aspects of it while using the ALG for the higher end more 
specific aspects.  Let the hardware ASICs do what they do best while 
letting the ALG do what it does best.



Grant. . . .
