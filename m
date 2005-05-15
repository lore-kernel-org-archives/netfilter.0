From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: ls delayed !!!
Date: Sun, 15 May 2005 21:03:35 +0200
Message-ID: <42879D07.90703@danbbs.dk>
References: <1115910577.26182.53.camel@maclinux.lotus>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115910577.26182.53.camel@maclinux.lotus>
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
To: NetFilter <netfilter@lists.netfilter.org>
Cc: brunO <bruno@vestcon.com.br>

brunO wrote:
> Hello ! 
> 
> I am with following problem, I have ftp server functioning behind a
> GATEWAY, the user effects login normally, obtains to create directory
> and to remove directory, only has a problem that when the user tries to
> list the content any directory, delays and it does not list the content,
> appears the following acknowledgment of time-out connection, somebody
> can help to decide this problem ?

Could be that your ftp server doesn't allow listing contents.

> Below I placed the procedure of login of user
> 
> Name (200.144.110.177:paul): user
> 331 Password required for user.
> Password:XXXXX
> 230 User user logged in.
> Remote system type is UNIX.
> Using binary mode to transfer files.
> ftp> ls
> 227 Entering Passive Mode (200,144,110,177,170,63)

Does your iptables allow passive or active ftp?
You say users can create/delete directories, indicating that passive ftp 
does work, though..

-- 
Kind regards,
Mogens Valentin


