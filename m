From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: FORWARD question
Date: Fri, 21 Nov 2003 08:50:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBE183F.6030109@Loudoun-Fairfax.com>
References: <20031121132405.56143.qmail@web40812.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031121132405.56143.qmail@web40812.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Nick wrote:

>Now I really start getting it ! Thanks again Antony
>:-), and again, and again, and...
>
>Thanks for the link. I had read that tutorial but
>obviously reading it was not enough. Now when I
>actually start using it I begin to understand the
>theory. It's cool, I like it...
>
>So, basically when I FORWARD FTP requests to the FTP
>server I don't need INPUT, unless the server is on the
>routing machine. INPUT is being used only for the
>routing machine. 
>  
>
Keep in mind that without putting any rules on the INPUT chain your 
firewall box is either totally open or totally closed (i.e. iptables -t 
filter -P INPUT ACCEPT or DROP). Generally you need rules on both the 
INPUT and FORWARD chains although the rules will be somewhat different. 
Take a look at Oskar's sample scripts.

>I guess if I wanted to set up a firewall on the FTP
>machine, then I would use INPUT on that machine. 
>  
>

Yes, but you probably ought to anyway.

>OK, I'll eperiment with it :-) 
>
>P.S. I read the correction. Now I understand enough to
>realize that it was only a typ ;-)
>  
>
Indeed.  Antony, screw up like that again and I'll have to fire you!!  ;-)

Jeff


