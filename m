From: Geog Hofstetter <geggo@g3gg0.dyndns.org>
Subject: Flag SYN not necessarily state NEW?
Date: 16 Jun 2002 20:04:56 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024250696.6468.3.camel@geggo>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan>
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
To: NetFilter Mailinglist <netfilter@lists.samba.org>

hmm is it possible that (if u use target LOG) your syslog just shows up 
'blah: SYN packet received'
'last message repeatet 2 times'

;)


    >>On Wed, 8 May 2002, Ing. Christian Ogris wrote:
    >> I connect from Box A via SSH to Box B, where the firewall runs, and i
    >>get the state "NEW" on the first packet.
    >> Then - the first connection is still established - i connect AGAIN from
    >>Box A to Box B and do NOT get the state "NEW" anymore. (So obviously
    >> it's already accepted by the ESTABLISHED,RELATED -j ACCEPT rule).
    >> Is this behavior correct?
    



