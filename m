From: Frank Smith <fsmith@hoovers.com>
Subject: limit match log question
Date: Wed, 30 Apr 2003 09:52:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <17030000.1051714338@hoovers-59.hoovers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

If you are using the limit match to control the number of log entries, is
there any way to also show the number of matches?  Something like syslog's
ability to combine repeated events into 'last message repeated 2318 times'.
   For example, if I limit logging of a match to 1 per 5 seconds to avoid
log flooding, I can't easily tell if I'm dropping 1 packet per 5 seconds
or 1000.  Or is there some option or patch to do this that I just haven't
noticed?

Frank


--
Frank Smith                                             fsmith@hoovers.com
Systems Administrator                                  Voice: 512-374-4673
Hoover's Online                                          Fax: 512-374-4501

