From: "j davis" <davis_compz@hotmail.com>
Subject: Re: Printing through firewall
Date: Fri, 31 May 2002 08:00:57 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F1600mAAkJJHjWpiOYS00011447@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

you could also use tcpdump on the firewall and grep for the ip or name  of 
the printer this way you would not have to mess with the rule set on your 
firewall also if you have a explicit drop rule that your printer traffic 
would treverse before it hit your log rule you would not get any info.

jd

>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>To: netfilter@lists.samba.org
>Subject: Re: Printing through firewall
>Date: Fri, 31 May 2002 08:23:17 +0100
>MIME-Version: 1.0
>Received: from hotmail.com ([65.54.236.45]) by hotmail.com with Microsoft 
>SMTPSVC(5.0.2195.4905); Fri, 31 May 2002 00:27:15 -0700
>Received: from lists.samba.org ([198.186.203.85]) by hotmail.com with 
>Microsoft SMTPSVC(5.0.2195.4905); Fri, 31 May 2002 00:24:08 -0700
>Received: from va.samba.org (localhost [127.0.0.1])by lists.samba.org 
>(Postfix) with ESMTPid 592EF423E; Fri, 31 May 2002 00:27:20 -0700 (PDT)
>Received: from Networker.rockstone.co.uk 
>(pc3-oxfd2-3-cust115.oxf.cable.ntl.com [62.254.137.115])by lists.samba.org 
>(Postfix) with ESMTP id 70F854125for <netfilter@lists.samba.org>; Fri, 31 
>May 2002 00:26:41 -0700 (PDT)
>Received: from there ([192.168.42.108])by Networker.rockstone.co.uk 
>(8.11.4/8.10.2) with SMTP id g4V7NHA23529for <netfilter@lists.samba.org>; 
>Fri, 31 May 2002 08:23:18 +0100
>Delivered-To: netfilter@lists.samba.org
>Message-Id: <200205310723.g4V7NHA23529@Networker.rockstone.co.uk>
>Organization: Software Solutions
>X-Mailer: KMail [version 1.3.2]
>References: <F1140wZDyDG742l3ew10000adae@hotmail.com>
>In-Reply-To: <F1140wZDyDG742l3ew10000adae@hotmail.com>
>Sender: netfilter-admin@lists.samba.org
>Errors-To: netfilter-admin@lists.samba.org
>X-BeenThere: netfilter@lists.samba.org
>X-Mailman-Version: 2.0.8
>Precedence: bulk
>List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
>List-Post: <mailto:netfilter@lists.samba.org>
>List-Subscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=subscribe>
>List-Id: netfilter user discussion list <netfilter.lists.samba.org>
>List-Unsubscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
>List-Archive: <http://lists.samba.org/pipermail/netfilter/>
>Return-Path: netfilter-admin@lists.samba.org
>X-OriginalArrivalTime: 31 May 2002 07:24:08.0967 (UTC) 
>FILETIME=[2760A970:01C20874]
>
>On Friday 31 May 2002 6:23 am, Dick Ah wrote:
>
> > Hi,
> > I have been examining the possibility of allowing some external hosts
> > (red-hat 6.2 with lpd)to print to some of our internal printers
> > (HP-JetDirect) through my firewall in company which firewall machine is
> > red-hat 7.2 using iptables . Anyone knows which ports need to be open??
>
>I don't know, but here's how to find out:
>
>Put a rule near the top of your FORWARD chain:
>
>iptables -I FORWARD -s 11.22.33.44 -d 22.33.44.55 -j LOG 
>--log-prefix=printing
>
>where 11.22.33.44 is the IP address of the external host trying to print, 
>and
>22.33.44.55 is the IP address of the printer.
>
>Then try to print, and look at the log file to see what got sent between 
>the
>machines.
>
>If you want to, you can always put a similar rule with the IP addresses
>reversed, to see what comes back from the printer to the host, but I doubt
>that you need that.
>
>Once you've seen what sort of protocol (TCP or UDP hopefully) and what port
>numbers are being used, you should easily be able to create a rule to allow
>the communication.
>
>
>Antony.




_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com


