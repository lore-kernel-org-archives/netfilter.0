From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: Ftp (pass mode ) and Iptables
Date: Fri, 06 Jan 2006 10:37:09 +0100
Message-ID: <43BE3A45.1060802@prosyst.com>
References: <43BCE38B.5080007@prosyst.com>	<AHELLDGFDKOONCHKKFCCEELOCBAA.eric.marty1@libertysurf.fr>
	<d27cd2010601052230r6453298aq@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010601052230r6453298aq@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

ludi wrote:
> I'm sorry. I lost the rules of ftp I insert when I setup the proftp.
> iptables -A INPUT 1 -p tcp  -s 0/0 -d $HOME_ADDR --dport 8888 -j  ACCEPT
> ;)
> 
> I can connect the ftp if I disabled the iptables. Otherwise, it would
> timeout when cuteftp made a list.
> I enforced to use the PORT command , and it worked well.
> I think the command channel established, however, the require was
> filtered when the cuteftp make a data connection .So I want to know
> whether the iptables can resolve the promblem?

What has tcp port 8888 to do with FTP? Or you changed the FTP server
settings to bind itself on port 8888? Correct?

The ipt_conntrack_ftp module is listenning for PORT and PASV on the
command channel running on port 21. If you bind your FTP server to
another port then you need to correct the include file of the module
as well:

 From include/linux/netfilter_ipv4/ip_conntrack_ftp.h:
	#define FTP_PORT        21
change to
	#define FTP_PORT	8888

And then recompile the module.

I'm not sure and had no time to look if the module itself accept
parameters. If its true then you don't have to compile anything,
simply find out the ipt_conntrack_ftp insmod options.



