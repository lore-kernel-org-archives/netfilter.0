From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: ftp behind the firewall
Date: Mon, 14 Feb 2005 10:14:41 -0700
Message-ID: <4210DC81.40106@utilitran.com>
References: <1108400909.4852.6925.camel@Linsaidin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108400909.4852.6925.camel@Linsaidin>
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
To: Travis Crook <travis@visionsbeyond.com>, netfilter@lists.netfilter.org

Hello,

	Well to start you should find out the difference between the 
connections. For example the standard "ftp" command in Linux will use 
ACTIVE mode by default, were in windows Internet Explorer (if that is 
what you are using) may be using PASSIVE mode.

Or if you are using LFTP in Linux, it usually uses PASSIVE mode by 
default, and the command line FTP client in Windows would most likely 
use ACTIVE mode by default.

You need to narrow down the problem, try issuing the command "passive" 
to the Linux "ftp" command and see if that solves the problem. If so, 
then your active mode connections are not working.



Michael.


Travis Crook wrote:
> Hi all,
> 	I would like to ask a question just for clarification.  I have a
> firewall up and running just fine.  My problem is that I cannot ftp
> through the firewall on a linux machine.  My windows machines don't seem
> to have this problem.  Am I missing something?  Or is it a local linux
> computer configuration issue.  I'll gladly provide any necessary
> information.
> 
> Thanks!
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

Hey, let me file that under important .... > /dev/null
...
"Hey did you read my e-mail"
"Let my check"
^From:.* > /dev/null
"Nope, I missed it, send it again"

