From: seberino@spawar.navy.mil
Subject: these INPUT and OUTPUT rules blocking more than desired....
Date: Mon, 28 Feb 2005 17:43:08 -0800
Message-ID: <20050301014308.GA18177@spawar.navy.mil>
Mime-Version: 1.0
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

The snippet below was intended to *ONLY* allow types of traffic that
I desired in and out of PC.  For example, I tried to only allow DNS, SSH
and HTTP.

These services don't work.  It seems like they need more than /one/
port opened.  Or, they need something else I'm forgetting.
Any help would be greatly appreciated.....

      # INPUT

      $IPTABLES -t filter -A INPUT                      \
                -i $INTERNET_INTERFACE                  \
                -d $INTERNET_ADDRESS                    \
                -m state --state ESTABLISHED,RELATED    \
                -j ACCEPT
      for PORT in $OPEN_INCOMING_TCP_PORTS; do
         $IPTABLES -t filter -A INPUT                   \
                   -i $INTERNET_INTERFACE               \
                   -d $INTERNET_ADDRESS                 \
                   -p tcp --dport $PORT                 \
                   -j ACCEPT
      done
      for PORT in $OPEN_INCOMING_UDP_PORTS; do
         $IPTABLES -t filter -A INPUT                   \
                   -i $INTERNET_INTERFACE               \
                   -d $INTERNET_ADDRESS                 \
                   -p udp --dport $PORT                 \
                   -j ACCEPT
      done

      # OUTPUT

      $IPTABLES -t filter -A OUTPUT                     \
                -o $INTERNET_INTERFACE                  \
                -s $INTERNET_ADDRESS                    \
                -m state --state ESTABLISHED,RELATED    \
                -j ACCEPT
      for PORT in $OPEN_OUTGOING_TCP_PORTS; do
         $IPTABLES -t filter -A OUTPUT                  \
                   -o $INTERNET_INTERFACE               \
                   -s $INTERNET_ADDRESS                 \
                   -p tcp --dport $PORT                 \
                   -j ACCEPT
      done
      for PORT in $OPEN_OUTGOING_UDP_PORTS; do
         $IPTABLES -t filter -A OUTPUT                  \
                   -o $INTERNET_INTERFACE               \
                   -s $INTERNET_ADDRESS                 \
                   -p udp --dport $PORT                 \
                   -j ACCEPT
      done

