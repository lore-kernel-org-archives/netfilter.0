From: Gervasio Bernal <gervasiobernal@speedy.com.ar>
Subject: New extension: CRYPT target
Date: Tue, 23 May 2006 20:33:02 -0300
Message-ID: <44739BAE.7060208@speedy.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all!!!

After some months of development we have finished this new extension.
CRYPT is a new target extension for Netfilter/Iptables that enables the
user to encrypt, decrypt and authenticate any IP protocol traffic using
the Linux Cryptographic API.

For example, if you want to encrypt active FTP (TCP) traffic between
host A and host B, you can do as follows:

(on host A, 1.2.3.4, FTP client)
# iptables -t mangle -A POSTROUTING -d 1.2.3.5 -p tcp --dport 20:21 -j
CRYPT --cipher blowfish --key topsecret --mode ecb --direction encrypt
# iptables -t mangle -A PREROUTING -s 1.2.3.5 -p 206 -j CRYPT --cipher
3des --key topsecretkeyinascii12345 --mode cbc --direction decrypt

(on host B, 1.2.3.5, FTP server)
# iptables -t mangle -A POSTROUTING -d 1.2.3.4 -p tcp --sport 20:21 -j
CRYPT --cipher 3des --key topsecretkeyinascii12345 --mode cbc
--direction encrypt
# iptables -t mangle -A PREROUTING -s 1.2.3.4 -p 206 -j CRYPT --cipher
blowfish --key topsecret --mode ecb --direction decrypt

_Note_ the symmetry in the rules. Also note the use of protocol 206
(CRYPT_PROTOCOL) in decryption.

You can download it from:
http://crypt.negocios-sa.com.ar

We hope you can test it and we are open for comments and suggestions.

--
Gervasio Bernal <gervasiobernal(at)gmail(dot)com>
Pedro Deis <pedrakos(at)gmail(dot)com>

