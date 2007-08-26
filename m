From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: about ipt_string
Date: Sun, 26 Aug 2007 17:02:27 -0400
Message-ID: <20070826210227.GA11193@minastirith>
References: <46cce0f3.22bd720a.5b5c.ffffc703@mx.google.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <46cce0f3.22bd720a.5b5c.ffffc703@mx.google.com>
Content-disposition: inline
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

On Aug 23, 2007, CrackyBlue wrote:

> Hi,
> 
> I am just wondering why this script don't block 
>  
> iptables -A INPUT -p tcp -m string --string 'bittorent' --algo kmp -d 0/0
> --dport 80 -j REJECT
> 
> I have iptables 1.3.8 and 2.6.17 kernel and ipt_string is already loaded

The Snort community has two rules that are designed to detect Bittorrent
communications in the 'p2p.rules' file, and you could use fwsnort to
recast these into iptables rules:

http://www.cipherdyne.org/fwsnort/

The Snort rule ID's are 2180 and 2181, and if you want fwsnort to use the
REJECT target against Bittorrent traffic, then use the --ipt-reject
argument like so:

# fwsnort --snort-sids 2180,2181 --ipt-reject
[+] Parsing Snort rules files...
[+] Found sid: 2180 in p2p.rules
    Successful translation.
[+] Found sid: 2181 in p2p.rules
    Successful translation.

[+] Logfile: /var/log/fwsnort.log
[+] iptables script: /etc/fwsnort/fwsnort.sh

Here is an example iptables command that fwsnort will execute to block
Bittorrent traffic (where 192.168.10.0/24 is an internal network
protected by iptables):

$IPTABLES -A FWSNORT_FORWARD_ESTAB -s 192.168.10.0/24 -p tcp --dport
6881:6889 -m string --hex-string "|13|BitTorrent protocol" --algo bm
--to 84 -j REJECT --reject-with tcp-reset

(If you want to try this, then please install fwsnort-1.0.2 since there
have been some bug fixes).

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

