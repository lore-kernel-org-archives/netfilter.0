From: Martin Josefsson <gandalf@tux.rsn.bth.se>
Subject: RE: new tcp connections, without SYN
Date: 09 Apr 2003 16:00:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049896827.1313.148.camel@tux.rsn.bth.se>
References: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: Netfilter <netfilter@lists.netfilter.org>, carlosble@terra.es, blancher@cartel-securite.fr

On Wed, 2003-04-09 at 15:00, dhiraj.2.bhuyan@bt.com wrote:
> As far as I understand, an "ACK" packet can also start a "NEW" connection.
> If the connection remains idle for long, the Netfilter's connection tracking
> engine times out that connection and removes it's entry from the state
> table. Now when an "ACK" packet comes back after sometime, the connection
> tracking engine marks this as a "NEW" connection. However am not sure how
> the state changes to "ESTABLISHED".

IIRC there's been som discussion about how Internet Explorer violates
the tcp standard. Some versions start their tcp sessions with a ACK
instead of a SYN. And there's an hack in the windows OS that accepts
that if it's destined for an IIS webserver I think. This is to shorten
the amount of time needed for connection setup.

If connection-pickup is enabled they will be marked as NEW even though
they don't contain a SYN. If connection-pickup is disabled the packets
will be marked as INVALID.

-- 
/Martin

