From: yu5p97f02-O/bDAPVd7B0N+BqQ9rBEUg@public.gmane.org
Subject: Matching UDP broadcasts using RELATED
Date: 04 Jan 2004 02:14:43 +0000
Sender: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <xiwu88jw8c.fsf@random-node.example.org>
Mime-Version: 1.0
Return-path: <netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
Errors-To: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmI2yCS0tKOigE@public.gmane.org>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIRj+87qQpzpCql8G6E966Ow@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIFcjs2lY4wUfKtGCp0j7rLg@public.gmane.org>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org


For protocols which work by initiating a request using a UDP broadcast and
expecting a reply for a specific host, is there any way to match the reply
back to the original broadcast.

An example of something that does this is smbmount, a request is broadcast to
the localnet with a port set to the netbios-ns port, and then smbmount expects
a reply from a particular host to the initiating port.

-- 



