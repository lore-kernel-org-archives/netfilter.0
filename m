From: Scott MacKay <scottmackay@yahoo.com>
Subject: Packet injection
Date: Mon, 12 Jan 2004 11:04:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040112190401.2995.qmail@web13905.mail.yahoo.com>
References: <20040112175640.GC8023@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040112175640.GC8023@cannon.eng.us.uu.net>
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
To: netfilter@lists.netfilter.org

I was wondering, is there any sample code of injecting
new packets while userspace processing?  I was looking
for something that could add a new packet in the QUEUE
target userspace program or to inject a packet back at
the start of the whole processing.  I was looking to
inject with the hope of writing the entire packet
header structure, not just the IP contents.  Any
samples or URLS?

__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus

