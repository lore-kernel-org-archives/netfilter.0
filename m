From: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>
Subject: RE: Port forward
Date: Tue, 4 Feb 2003 14:43:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D007132BBC42D5118FD20002A52844414BCF34@ASC01>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: 'saint' <nagajuna@optushome.com.au>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Why I used telnet was just for testing. I wanted to test to make sure that
if I connected to port 25 with telnet to my firewall that it redirected me
to the mail server. And as it seems it doesn't work, because I get an error
that no connection can me estabslihed. And offcource for management purpose
I use SSH..:)


-----Original Message-----
From: saint [mailto:nagajuna@optushome.com.au]
Sent: dinsdag 4 februari 2003 14:31
To: ASC - Ronald Roeleveld; Netfilter Mailing List
Subject: RE: Port forward


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
	 

