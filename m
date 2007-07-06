From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Rate Limiting After a Threshold
Date: Fri, 06 Jul 2007 07:25:25 +0200
Message-ID: <468DD245.3080504@rchq.co.za>
References: <468D63F2.7060402@siemens.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030605080900070002000408"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <468D63F2.7060402@siemens.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: John Jung <john.j.jung@siemens.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030605080900070002000408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



John Jung wrote:
> Hi,
>
>   I'm new to IP Tables in general, but I've been able to whack away at 
> the rules to get connlimit to do what I want.  Now I'm trying to do 
> something more sophisticated, but it doesn't seem to work.
>
>   My ultimate goal is to allow most Web users to access my site, but 
> to slow down the abusers.  So, for example, I want to let in the first 
> 10 HTTP connections in, and then after that, limit that IP to only 20 
> connections per minute afterwards.  (And then after a certain point, 
> connlimit will block any additional connections by that IP.)
>
>   I'm using a vanilla 2.6.21.3 Linux kernel, but I can't figure out 
> how to do it.
>
>   I think hashlimit is the key, but it really just doesn't want to 
> work for me.  For example, I've tried:
>
>     iptables -A INPUT -p tcp --dport 23 -m hashlimit --hashlimit 1/hour
>       --hashlimit-mode srcip --hashlimit-burst 1 --hashlimit-name test
>       -j REJECT
>
>   but I can open up more than 1 telnet session in under a minute, let 
> alone an hour.
>
>   I've read and re-read the hashlimit man page, tried various 
> arguments that I've found on on the Web, all to now avail.
>
>   Any and all suggestions are welcomed.
If you're using iptables, what OS are you using? Why are you using the 
telnet port (23)? instead of the SSH port (22)?

-- 
<img src='http://www.danasoft.com/sig/spoonssig.jpg' />
--------------------------------------------------
RCHQ Hobbies cc
http://www.rchq.co.za and http://store.rchq.co.za
Fax: +27 86 652 2773       eMail: admin@rchq.co.za
P O Box 10376, Vorna Valley, Midrand, 1686
--------------------------------------------------


--------------030605080900070002000408--

