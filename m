From: Jason Opperisano <opie@817west.com>
Subject: Re: ls delayed !!!
Date: Mon, 16 May 2005 16:53:13 -0400
Message-ID: <20050516205313.GA30898@bender.817west.com>
References: <1115910577.26182.53.camel@maclinux.lotus>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 12, 2005 at 12:09:38PM -0300, brunO wrote:
> Hello ! 
> 
> I am with following problem, I have ftp server functioning behind a
> GATEWAY, the user effects login normally, obtains to create directory
> and to remove directory, only has a problem that when the user tries to
> list the content any directory, delays and it does not list the content,
> appears the following acknowledgment of time-out connection, somebody
> can help to decide this problem ?
> 
> 
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

assuming your FTP server is running on port 21:

  modprobe ip_conntrack_ftp
  modprobe ip_nat_ftp		(only if you're NAT-ing the server)

and allow RELATED connections through your FORWARD chain.

-j

--
"Lois: Stewie, why don't you go play in the other room.
 Stewie: Why don't you burn in hell."
        --Family Guy

