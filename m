From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 08:15:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382AAE@fsnsab20.losangeles.af.mil>
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
To: "'markee@bandwidthco.com'" <markee@bandwidthco.com>, 'Sudheer Divakaran' <sudheer@svw.com>, 'Netfilter mailing list' <netfilter@lists.netfilter.org>

this should be a basic rule of netsec 101 ...

one should have to 'turn' on any allowed traffic out of the box.

i.e......the firewall should not allow ANY traffic by default until
specifically
		TOLD TO DO SO BY THE ADMIN.

this is a good thing.



####################################
# delbert.hudson@losangeles.af.mil #
#        61cs/scbn, 3-0182         #
####################################


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Mark E.
Donaldson
Sent: Wednesday, August 18, 2004 9:19 PM
To: 'Sudheer Divakaran'; 'Netfilter mailing list'
Subject: RE: A simple question


 
In almost all IP Tables articles I've found that the default policy of all
tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as far as
INPUT and FORWARD tables are concerned, but I do not understand why should
we set the default policy of OUTPUT chain to DROP.  OUTPUT chain is
responsible for packets originating from the firewall itself.  
Whay should we DROP it?

Thanks,
Sudheer

What you say is indeed correct. Most of the articles on the subject do
recommend a default DROP on all three tables. However, I personally do set
my OUTPUT default to ACCEPT, while my FORWARD and INPUT are definitely set
to DROP. As you might expect, it is quite easy to DOS the firewall itself
when OUTPUT is set to DROP. And that is not a real good idea. However,
having said that, close scrutiny must be paid to what you allow out of the
firewall and the necessary rules must be in place.



