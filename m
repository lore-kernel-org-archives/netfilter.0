From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Yet another local nat/port redirecting question
Date: Thu, 26 Apr 2007 12:10:42 +0200
Message-ID: <46307AA2.5080007@freemail.hu>
References: <200704241701.28038.henrik@netgate.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704241701.28038.henrik@netgate.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Henrik Martin <henrik@netgate.net>
Cc: netfilter@lists.netfilter.org

As Martijn wrote: the problem could be that you run the web server 
binded to a specific IP.

What is the ouput of this? :

netstat -a -n | grep 8080


Swifty

