From: saint <nagajuna@optushome.com.au>
Subject: RE: Port forward
Date: 05 Feb 2003 00:31:15 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044365475.8127.6.camel@juna.cypherworld.org>
References: <D007132BBC42D5118FD20002A52844414BCF31@ASC01>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D007132BBC42D5118FD20002A52844414BCF31@ASC01>
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
To: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>, Netfilter Mailing List <netfilter@lists.netfilter.org>

I don't know what your setup is but I myself explicitly FORWARD
things to telnet:

e.g:

# Allow access to machines from the private LAN: 
iptables -A FORWARD -i INTERFACE_CONCERNED -o OUTPUT_INTERFACE -p tcp \
	 -s $LAN_MACHINES --sport $UN_PRIVILEGED_PORTS \
	 -d $DESTINATION_ADDRESS --dport 23 \
	 -m state --state NEW -j ACCEPT

you get the hint.

Any way why use telnet? I recommend secure shell (tcp port 22).

Santos.

Security is a blessing.
	 


