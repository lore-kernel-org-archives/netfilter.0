From: Paul Dunphy <pdunphy@research.ryerson.ca>
Subject: State Match Question
Date: Thu, 06 Jun 2002 15:44:58 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020606152834.02c4d128@mailhost.csca.ryerson.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Could some kind soul please explain to me (or point me to information 
about) what the difference is between filtering on state ESTABLISHED in 
iptables and filtering on ! --syn? In other words, what's the difference 
between saying

iptables -A FORWARD -p tcp -m state --state ESTABLISHED -j ACCEPT

and saying,

iptables -A FORWARD -p tcp ! --syn -j ACCEPT

My apologies if this has been discussed before - I am new to the list (and 
to iptables :)

Thanks,
Paul


---------------------------------------------------------------------
Paul T. Dunphy, P.Eng.
Systems Administrator/Research Engineer
Centre for the Study of Commercial Activity
Ryerson University
Toronto, Ontario, CANADA
E-mail: pdunphyATcsca.ryerson.ca


