From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: Stopping greedy http clients!
Date: Tue, 24 Sep 2002 16:41:05 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209241639480.8352-100000@dns.toxicfilms.tv>
References: <FD8F124A387AD6119F7900A0D218B3210198A0@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3210198A0@hslex01.hsl-brabantzuid.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

> Or use something (not netfilter related) like CBQ or HTB which implement
> bandwidth throttling.
> I found CBQ more difficult to setup than HTB, but the choice is yours.
There is a 3rd party module to apache, that allows to setup bandwidth and
concurrent connections, without making classes for traffic via tc.
I do not remember the nam right now, but it exists :)

Regards,
Maciej Soltysiak


