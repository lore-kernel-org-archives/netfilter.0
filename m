From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Fedora 3 + netfilter 1.2.11 + FXP
Date: Wed, 9 Mar 2005 10:10:52 +0200
Message-ID: <fad9d4840503090010220e735f@mail.gmail.com>
References: <C530C43619DA8F459D7A1A4DADE00EB1DD13@knowledge.wizdom.nu>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <C530C43619DA8F459D7A1A4DADE00EB1DD13@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="us-ascii"
To: Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter@lists.netfilter.org

I'm not too sure, but isn't FXP enabled or disabled in the FTP server?
As I understand it, when you do an FXP transfer you're asking FTP
server A to upload on your behalf to FTP server B. It's a normal FTP
'transaction' in every sense except that the files don't originate
from your box.

I could be wrong, but I hope this helps.


On Mon, 7 Mar 2005 13:03:23 +0100, Sietse van Zanen <sietse@wizdom.nu> wrote:
> Hello,
> 
> I am running a standard installation of Fedora Core 3 (2.6.10-1.770.FC3)
> & netfilter 1.2.11
> 
> Is there anybody here that can give me an answer to the following
> question:
> 
> Is it possible to enable FXP in this configuration? (above config, no
> new kernel compiling, patching etc)
> 
> If possible, how can I enable it?
> 
> I tried putting add options ip_conntrack_ftp fxp=1 in /etc/modules.conf,
> but this doesn't help
> 
> Spent all morning wading through the web and all the years old
> documentation available, but I haven't found what I was looking for.
> Found some stuff about this ftp-fxp patch, but that too seems legacy for
> very old version.
> 
> Greets,
> 
> Sietse
> 
> 


-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

