From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack.ftp.c and ip_nat_ftp.c and DNAT
Date: Tue, 18 Jun 2002 09:19:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206180819.g5I8JbA28591@Networker.rockstone.co.uk>
References: <02061815431200.01908@luoqiang>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02061815431200.01908@luoqiang>
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
To: netfilter@lists.samba.org

On Tuesday 18 June 2002 8:43 am, luoqiang wrote:

> Hi,all
>
>     After reading the hacking howto and the code of ip_conntack_ftp.c and
> ip_nat_ftp.c,I want to write a module for DNAT to achieve the purpose as
> follows:

> iptables -A PREROUTING -t nat -p udp -d 159.226.1.1 --dport 5003
> -j DNAT --to 192.168.1.2:5003

Excuse my ignorance here, but why do you need to write a module for this ?   
Why can't you just do it with a rule such as the one you've written ?

 

Antony.

