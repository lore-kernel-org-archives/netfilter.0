From: Jacob Hansen <luffe@diku.dk>
Subject: tcpdump and netfilter
Date: 14 Jun 2002 18:42:13 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <y9sbsadzuai.fsf@pc-024.diku.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi everyone,

I know this question has been asked before, but the answers seem to
point in several different directions.

When does tcpdump sniff it's packets? Is it before any nf hook for
inbound packets and post all nf hooks for outbound packets?

I am writing a packet mangling kernel module and tcpdump reports very
odd-looking IP packets, that i cannot seem to pinpoint at any nf_hook.

Any suggestions as to a debugging approach?

Thanks.

-- 
Jacob Hansen. U of Copenhagen, Dept. of Computer Science
e-mail : luffe@diku.dk


