From: Hilko Bengen <bengen@vdst-ka.inka.de>
Subject: Re: How will I mesure my bandwith
Date: 05 Nov 2002 15:47:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87u1iwf4zg.fsf@ataraxia.hilluzination.de>
References: <Pine.GSO.4.40.0211041029270.5446-100000@amazonas.robotic.dlr.de>
	<004501c284d1$0336ceb0$8c01a8c0@sundaram>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004501c284d1$0336ceb0$8c01a8c0@sundaram>
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
To: Sundaram Ramasamy <sun@percipia.com>
Cc: netfilter@lists.netfilter.org

"Sundaram Ramasamy" <sun@percipia.com> writes:

> We have 512kbps connection to our office, How will I measure my
> bandwidth.

If you are interested in more detailed information, my ulog-acctd
(http://savannah.nongnu.org/projects/ulog-acctd) may be the solution
for you.

You can also use a tool like MRTG that looks at the interface byte
counters on a regular basis and puts out nice graphs based on those
numbers. But AFAIK you also need a working SNMP daemon setup for that.

-Hilko

