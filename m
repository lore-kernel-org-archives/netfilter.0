From: Jose Horacio Mello de Jesus <jose.jesus@inteli.com.br>
Subject: open port for external connections
Date: Wed, 26 Jan 2005 18:31:50 +0000
Message-ID: <41F7E216.5090505@inteli.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

    I have a following network environment:

             DSL                                                       =20
GW                               SERVER=20
1                                                         SERVER 2

    xxx.xxx.xxx.xxx:8080 eth0 <-----------> 192.168.1.25 eth0
                                                                 =20
192.1.1.1 eth1 < ---------- > 192.1.2.1 eth0
                                                                           =
             =20
                      192.1.3.1 eth1
                                                                           =
                      =20
             192.1.4.1 eth2 <----------> HUB <----------> =20
192.1.4.100:5000 eth0
                                                                         =20
    I need open 5000 port to external intranet access on 8080 port.

    Thank's,                    =20

            Jos=E9 Hor=E1cio.                               =20

INTELI Tecnologia em Alta Seguran=E7a
Fone/Fax: +55-51-3019-8388
*** Importante ***
Esta mensagem, incluindo seus eventuais anexos, tem car=E1ter confidencial e
seu conte=FAdo =E9 restrito ao(s) destinat=E1rio(s) da mensagem. A INTELI n=
=E3o =E9
respons=E1vel pelo conte=FAdo ou a veracidade desta informa=E7=E3o. Caso vo=
c=EA
tenha recebido esta mensagem por engano, queira por favor imediatamente
retorn=E1-la ao emissor e apag=E1-la sem a leitura de seus arquivos. Qualqu=
er uso,
replica=E7=E3o ou dissemina=E7=E3o desta mensagem ou parte dela =E9 proibid=
o.



