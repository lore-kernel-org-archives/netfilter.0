From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Debug
Date: Mon, 23 Feb 2004 15:12:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040223151221.3ea3083a.arnt@c2i.net>
References: <BAY7-DAV50ii08N8yxd00027876@hotmail.com>
	<1077543593.1658.2.camel@pepelui.baicom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077543593.1658.2.camel@pepelui.baicom>
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

On Mon, 23 Feb 2004 10:39:54 -0300, 
Alexis <alexis@attla.net.ar> wrote in message 
<1077543593.1658.2.camel@pepelui.baicom>:
> 
> On Mon, 2004-02-23 at 04:36, Shaju wrote:
> > Hi,
> >  
> >          I have setup gateway-proxy firewall using redhat linux 7.1
> > and i have replaced the default  /etc/rc.d/init.d/iptables script
> > with my own script, and restart the iptables service. It shows me
> > done. when i tried "service iptables status" it shows iptables
> > stopped. please help me to fix this issue.
> >  
> because in init.d are sysv init scripts, make shure that your scripts
> complies these requirements.
> 

..also, Red Hat quit supporting all but Red Hat 9 on Dec. 31'th 2003,
RH9 support "dies" on April 1'st 2004, so you will want to buy support
from RH or someone else, or transform to Fedora, I went for Debian, 
I made that decision before I knew of Fedora and Red Hat's legal 
action on the SCO Group.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



