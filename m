From: "Zhen Zhou" <zhouzhenzj@gmail.com>
Subject: is it possible to nat to the routed IP?
Date: Tue, 12 Dec 2006 14:34:31 +0800
Message-ID: <ad41208c0612112234m5f2e564fm217faff87955641a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
content-type: text/plain; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

one example network looks like:

        210.153.22.x, 210.153.22.y
                        eth1
                          |
                     gateway
                          |
                        eth0
                  192.168.5.201
                          \
                            \
                              \
                       192.168.5.202
                             eth0
                                  \
                                 router
                                      \
                                     eth4
                                 192.168.3.254
                                          |
                                     Internal
                                          |
                                 192.168.3.208


So is it possible to nat from 210.153.22.y to 192.168.2.208?
If possible, how to do it=1B

Thanks a lot,


Zhou

