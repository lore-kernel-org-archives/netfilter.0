From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: general policy question
Date: Fri, 7 Jun 2002 12:50:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020607165002.GM29214@cannon.eng.us.uu.net>
References: <B9254FF5.1C46%patrick@wechsler.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <B9254FF5.1C46%patrick@wechsler.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: patrick conlin <patrick@wechsler.com>
Cc: netfilter@lists.samba.org

On Thu, Jun 06, 2002 at 05:44:21PM -0400, patrick conlin wrote:

> does one generally set the -P on their mangle table chains to DROP, even if
> you're not using them for anything?
> 
> usual procedure says set -P on all chains to DROP and allow what's
> necessary,

Apparently they meant the "filter" table and not mangle or nat.

Ramin

> but if you're not using your mangle table chains for anything and
> you set -P to DROP (on the iptables -t mangle PREROUTING chain, for example)
> all packets get dropped.
> 
> you guessed it, I just did this and got booted from the machine. Now I have
> to wait until I can go home and reboot my firewall before I can play with it
> any more.
> 
> Just wondering how everyone else handles this.
> 
> -=p=-
> 

