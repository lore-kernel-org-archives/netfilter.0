From: Keith Ealanta <kealanta@golfpartners.com.au>
Subject: iptables, uids, ssh and port forwarding.
Date: Thu, 18 Dec 2003 15:19:55 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23FE389FE273D211BBB000A0C9ADF7E3B28CF7@MAIL1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've gathered that packets forwarded from elsewhere can't be restricted by
uid.
Is it different if the user is using ssh port-forwarding?
What I find myself needing to do is to allow a couple of external
contractors to have access to different points in our network.
While adequately trusted (i.e. I'm willing to let them ssh in) I'd like to
restrict where else they can connect to.
My thought was that, because the connection is coming through SSH, there is
a local user associated with the connection.
Can anyone confirm this?
If not, and allowing that the contractors are not on fixed ip addresses, how
would you recommend I allow (an unknown number of) people each to have
access to a different specific list of address/port pairs in my local
network?

Hoping someone can come up with something

> 	Keith Ealanta
> 	Support Engineer
> 
> 	There are 10 types of people in this world, those who understand
> trinary, those who don't, and those who are sick of this joke.
-------------------------------------------------------------
Keith Ealanta
Software Support Engineer 

Golf Partners Australia Limited
Tel: +61 3 8575 5050
Direct: +61 3 03 8575 5085              
Mobile: 
Fax: +61 3 
Email: kealanta@golfpartners.com.au
Web: www.golflink.com.au
-------------------------------------------------------------
This message and any attachments (the "message") are confidential and
intended solely for the addressees.
Any unauthorised use or distribution is prohibited. 


