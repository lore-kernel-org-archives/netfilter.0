From: forum@users.pc9.org
Subject: Re: Logging
Date: Mon, 15 Mar 2004 10:36:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040315103608.cd6075d8@alkaid.pc9>
References: <1079365863.2163.8.camel@vejan>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079365863.2163.8.camel@vejan>
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
To: Mario Udina <m.udina@libero.it>
Cc: netfilter@lists.netfilter.org

> I have done some googling however did not manage to find out if there is
> a way to define a file where iptables writes its logs.

In UNIX, the 'syslog' interface uses two parameters for any information 
logged:

The logging facility
The logging level

I believe the facility is fixed to kernel, but the level can be changed. 
Corresponding to that is the configuration in syslog.conf

Another useful thing is --log-prefix in the iptables command, which lets 
you output a descriptive log prefix. You can then script your own log 
placement, using grep or something.

-- 
forum@users.pc9.org



