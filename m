From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 18:32:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER74ZDgC81TbdkS00000016@server7.bandwidthco.com>
References: <20040811200045.GA6472@uglabng.math.gatech.edu>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040811200045.GA6472@uglabng.math.gatech.edu>
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
To: 'Carlos Villegas' <villegas@math.gatech.edu>, 'Jason Opperisano' <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

 
Really? I thought "-j REJECT --reject-with tcp-reset" would always do the
right thing, even without specifying --syn (of course, it wouldn't be a bad
idea to specify it anyway). I have several systems running fine without the
--syn option explicitly mentioned. Could any of the "core"
guys say if my assumption is wrong? 

Carlos


My views are this: If you are going to reset a TCP connection, it is best to
do so at the earliest possible moment of a TCP session, preferably after the
initial syn of the three-way handshake. When I use "-j REJECT --reject-with
tcp-reset" it is always in response to a NEW (thus syn) packet. Perhaps Mr.
Stone will weigh in on this. If Chris Brenton is listening in, I would like
to hear his views on this as well.



