From: Erik Pagel <erik.pagel@gmx.de>
Subject: Re: Yet another FTP connection problem
Date: Thu, 06 Jun 2002 18:30:32 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <376479889.1023388232@[192.168.13.4]>
References: <200206061606.g56G6SA31895@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061606.g56G6SA31895@vulcan.rissington.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi,

--On Donnerstag, 6. Juni 2002 17:06 +0100 Antony Stone 
<Antony@Soft-Solutions.co.uk> wrote:

> On Thursday 06 June 2002 4:41 pm, Erik Pagel wrote:
>
>> iptables -N ftp
>> iptables -A ftp -p tcp --dport 20:21 -o $I_EXTERN -j ACCEPT
>> iptables -A ftp -p tcp --sport 20:21 -i $I_EXTERN -m state --state
>> ESTABLISHED,RELATED -j ACCEPT
>> iptables -A ftp -p tcp --dport 20:21 -i $I_EXTERN -m state --state
>> NEW,INVALID -j LOG --log-level warning --log-prefix "DROP:FTP Incomming"
>> iptables -A ftp -p tcp --dport 20:21 -i $I_EXTERN -m state --state
>> NEW,INVALID -j DROP
>
>> iptables -A INPUT   -j ftp
>> iptables -A OUTPUT  -j ftp
>> iptables -A FORWARD -j ftp
>
> That is a very strange set of rules to try applying to all three of
> INPUT,  FORWARD and OUTPUT chains !
>
> Please can you tell us whether you are trying to ftp from this machine
> with  the netfilter rules on, or is the netfilter machine acting as a
> router  between the ftp client and server ?

Both, I want so send files from this machine and this machine also act as 
router for my internal network.
That the reason why I apply the rules to all three chains.

>
> Antony.
>
bye Erik

