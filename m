From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to build a better security setup for my problem?
Date: Sat, 13 Mar 2004 18:33:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403131833.41690.Antony@Soft-Solutions.co.uk>
References: <20040313181927.80861.qmail@web41605.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040313181927.80861.qmail@web41605.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Saturday 13 March 2004 6:19 pm, Vlad H. wrote:

> 1.) What activity are you trying to allow?
> General internet access for a small group of users from a larger local
> network: web, ftp, mail, etc.

Okay, so you want these people to be able to do more or less anything, out to 
the Internet....

> 2.) What activity are you trying to prevent?
> Deny internet access for all other local users.

Well, yes, I assumed that - what I really meant was "what do you suspect your 
denied users will get up to, which you wish to detect and make ineffective?" 
In this case it seems that the answer is IP and MAC address stealing / 
spoofing.

> 3.) What is your concern?
> A denied user can change his mac address to aa:aa:aa:aa:aa:aa and ip
> address to x.x.x.x for example and become a valid internet user.

True.   Here are a few ideas which might help you:

1. Run arpwatch and keep an eye on the MAC/IP combinations which you see on 
the network.
2. Install an ssh server on the machines which are allowed access to the 
Internet, and periodically check that they can be connected to (using a 
digital signature, not a password).
3. Set up a VPN between the allowed clients and the firewall, so that a 
machine which cannot set up a VPN tunnel cannot route to the Internet.
4. Set up a proxy firewall instead of a packet filter, with user 
authentication for things like ssh, ftp, http, and selective filtering for 
things like pop3 & smtp.
5. Require users to log in to a (local) web server with a username and 
password, which if successful runs a script to install the netfilter rule 
enabling them access to the Internet.   The rule is removed either after some 
period of time, or when they close their browser connection, or something 
similar which meets your needs.
6. Don't give the users root (or Administrator) access to their machines so 
they cannot change their IP & MAC addresses.
7. Use a tool such as nmap to check the uptimes of clients which should be 
allowed access, and investigate any which seem to jump forward or backward.

Hope something here helps,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


