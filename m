From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: vpn under linux
Date: Mon, 12 Apr 2004 05:25:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040412122513.2441.qmail@web13908.mail.yahoo.com>
References: <20040410234127.GD14988@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040410234127.GD14988@samad.com.au>
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
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>

I had a couple questions about the different methods
talked about here, probably focusing on CIPE,
FreeSWAN/OpenSWAN, and the OpenVPN (along with any
others users may chime in with)
1.  Where in the netfilter path do these solutions
package up data?  Important to know if we see
tunnel/VPN packets or the contents which are going
into them, both incoming and outgoing
2.  Which of these guys support broadcast or
multicast?
3.  Do any of these support non-encrypted
transmission?  The reason for this would be if a
higher level/later service provided the encryption
over the risky sections of a transmission
4.  What kind of overhead do these cost?  I was
curious from the perspective of initialization/updates
and also any additional packet headers (rough guess). 


Thanks ahead of time!!

-Scott


__________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online by April 15th
http://taxes.yahoo.com/filing.html

