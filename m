From: "Halasan . Harvey" <harvey@hnu.edu.ph>
Subject: RE: RE: Yahoo Messenger
Date: Mon, 7 Oct 2002 06:04:39 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E17yR1F-0007tl-00@kashyyyk.netfilter.org>
Reply-To: harvey@hnu.edu.ph
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> 
> So, if you *don't* want users to connect to Yahoo Messenger, can't you
> do :
> 
> # If users are NAT-ed
> iptables -A FORWARD -d cs1.yahoo.com -j DROP
> iptables -A FORWARD -d cs2.yahoo.com -j DROP
> iptables -A FORWARD -d cs3.yahoo.com -j DROP
> 

Hi!

Ive already tried this about a month ago and but theres an error saying that "host/network 'cs1.yahoo.com' not found" ... this is also treu with cs2 and cs3 ...hmmm am i the only one getting this kind of error? Pls tell me

harvey

