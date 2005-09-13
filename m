From: "Albretch Mueller" <lbrtchx@hotmail.com>
Subject: logging to syslog in a stealth way
Date: Tue, 13 Sep 2005 12:42:28 +0000
Message-ID: <BAY101-F2441DE99F29B1A36730988B49C0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi *,

I could tell this is more of a Unix/Linux and syslog question, but since my 
end intention is using it with netfilter, I could imagine someone has come 
accross something like that before.

I would like for the logs produced by iptable (generally in 
/var/log/syslog), to be processed by an ng-syslog client and just popped as 
UDP packets

Search I did the mailing list (http://marc.theaimsgroup.com/?l=netfilter) 
for 'syslog udp' and couldn't find helpful info/leads and 'ng-syslog' or 
'ngsyslog' didn't give me a hit

How could you do something like that?

Thanks
Albretch



